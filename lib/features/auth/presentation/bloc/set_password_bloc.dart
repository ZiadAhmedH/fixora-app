import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/confirm_password_reset_use_case.dart';
import '../../domain/usecases/verify_reset_code_use_case.dart';
import 'set_password_event.dart';
import 'set_password_state.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SetPasswordBloc
// ─────────────────────────────────────────────────────────────────────────────
//
// Manages the entire Set New Password screen lifecycle:
//
//   1. On page open → verify the oobCode from the deep link.
//      If expired → show [codeError] state so user can go back and
//      request a new reset email. This is a security measure.
//
//   2. On every keystroke → evaluate password requirements in real-time.
//      No backend call needed — this is pure local logic.
//
//   3. On submit → call Firebase confirmPasswordReset.
//      Success → [success] state → GoRouter navigates to login.
//      Failure → [failure] state → snackbar shown, user stays on screen.
// ─────────────────────────────────────────────────────────────────────────────

class SetPasswordBloc extends Bloc<SetPasswordEvent, SetPasswordState> {
  SetPasswordBloc({
    required VerifyResetCodeUseCase verifyResetCode,
    required ConfirmPasswordResetUseCase confirmPasswordReset,
  })  : _verifyResetCode = verifyResetCode,
        _confirmPasswordReset = confirmPasswordReset,
        super(const SetPasswordState.validating()) {
    on<SetPasswordEvent>(_onEvent);
  }

  final VerifyResetCodeUseCase _verifyResetCode;
  final ConfirmPasswordResetUseCase _confirmPasswordReset;

  Future<void> _onEvent(
    SetPasswordEvent event,
    Emitter<SetPasswordState> emit,
  ) =>
      event.map(
        started: (e) => _onStarted(e.oobCode, emit),
        passwordChanged: (e) => _onPasswordChanged(e.password, e.confirm, emit),
        submitted: (e) => _onSubmitted(e.password, e.confirm, emit),
      );

  // ── STEP 1: Verify the oobCode when page loads ──────────────────────────

  Future<void> _onStarted(
    String oobCode,
    Emitter<SetPasswordState> emit,
  ) async {
    // We're already in [validating] from the initial state.
    // Call Firebase to check if the code is still valid.
    final result = await _verifyResetCode(oobCode);

    result.fold(
      // Code is expired/invalid — show a dedicated error state.
      // The UI will show a "Request new link" button.
      (failure) => emit(SetPasswordState.codeError(message: failure.map(
            server: (f) => f.message,
            cache: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (f) => f.message,
            notFound: (f) => f.message,
            unexpected: (f) => f.message,
          ))),

      // Code is valid — show the form. The returned [email] tells us
      // which account this reset is for, so we can display it.
      (email) => emit(SetPasswordState.ready(
            email: email,
            oobCode: oobCode,
          )),
    );
  }

  // ── STEP 2: Live password requirement evaluation ─────────────────────────

  Future<void> _onPasswordChanged(
    String password,
    String confirm,
    Emitter<SetPasswordState> emit,
  ) async {
    // Only makes sense when the form is visible.
    // We use [mapOrNull] to safely access the [ready] state fields.
    final current = state.mapOrNull(ready: (s) => s, failure: (s) => null);
    if (current == null) return;

    // [PasswordRequirements.evaluate] is pure — no async, no Firebase.
    // Update the requirements display on every keystroke.
    emit(SetPasswordState.ready(
      email: current.email,
      oobCode: current.oobCode,
      requirements: PasswordRequirements.evaluate(password),
    ));
  }

  // ── STEP 3: Submit the new password to Firebase ──────────────────────────

  Future<void> _onSubmitted(
    String password,
    String confirm,
    Emitter<SetPasswordState> emit,
  ) async {
    // Extract values from current state — guard: only proceed if ready.
    final current = state.mapOrNull(ready: (s) => s, failure: (s) => null);
    if (current == null) return;

    final requirements = PasswordRequirements.evaluate(password);

    // Double-check requirements before hitting Firebase.
    // The UI button is already disabled when invalid, but this is a safety net.
    if (!requirements.isValid) return;
    if (password != confirm) return;

    // Transition to loading — disables the button while Firebase responds.
    emit(SetPasswordState.loading(
      email: current.email,
      oobCode: current.oobCode,
      requirements: requirements,
    ));

    // Call Firebase confirmPasswordReset(oobCode, newPassword).
    // This is the actual password change. After this:
    //   • Firebase updates the password in their Auth system.
    //   • The oobCode is consumed — cannot be used again.
    //   • The user is NOT automatically signed in.
    final result = await _confirmPasswordReset(
      oobCode: current.oobCode,
      newPassword: password,
    );

    result.fold(
      (failure) {
        // Password reset failed. Keep the form alive so user can try again.
        // Common reasons: weak password, network error, code expired mid-session.
        emit(SetPasswordState.failure(
          message: failure.map(
            server: (f) => f.message,
            cache: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (f) => f.message,
            notFound: (f) => f.message,
            unexpected: (f) => f.message,
          ),
          email: current.email,
          oobCode: current.oobCode,
          requirements: requirements,
        ));
      },
      (_) {
        // Password changed successfully!
        // The [success] state triggers a navigation to the login screen
        // (handled in the page's BlocListener).
        emit(const SetPasswordState.success());
      },
    );
  }
}

