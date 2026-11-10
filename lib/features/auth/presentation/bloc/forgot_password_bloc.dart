import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/send_reset_email_use_case.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this._sendResetEmail)
      : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>(_onEvent);
  }

  final SendResetEmailUseCase _sendResetEmail;

  Future<void> _onEvent(
    ForgotPasswordEvent event,
    Emitter<ForgotPasswordState> emit,
  ) =>
      event.map(
        methodChanged: (e) async => _onMethodChanged(e.method, emit),
        sendRequested: (e) async => _onSendRequested(e.email, emit),
        resetState: (_) async => emit(const ForgotPasswordState.initial()),
      );

  void _onMethodChanged(
    ResetMethod method,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordState.initial(method: method));
  }

  Future<void> _onSendRequested(
    String email,
    Emitter<ForgotPasswordState> emit,
  ) async {
    // Keep the currently-selected method across all state changes.
    final currentMethod = state.map(
      initial: (s) => s.method,
      loading: (s) => s.method,
      success: (s) => s.method,
      failure: (s) => s.method,
    );

    emit(ForgotPasswordState.loading(method: currentMethod));

    final result = await _sendResetEmail(email.trim());

    result.fold(
      (failure) => emit(
        ForgotPasswordState.failure(
          message: failure.map(
            server: (f) => f.message,
            cache: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (f) => f.message,
            notFound: (f) => f.message,
            unexpected: (f) => f.message,
          ),
          method: currentMethod,
        ),
      ),
      (_) => emit(ForgotPasswordState.success(method: currentMethod)),
    );
  }
}
