import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_current_user_use_case.dart';
import '../../domain/usecases/login_with_email_use_case.dart';
import '../../domain/usecases/login_with_google_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/watch_auth_state_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailUseCase _loginWithEmail;
  final RegisterUseCase _register;
  final LoginWithGoogleUseCase _loginWithGoogle;
  final LogoutUseCase _logout;
  final GetCurrentUserUseCase _getCurrentUser;
  final WatchAuthStateUseCase _watchAuthState;

  StreamSubscription? _authSubscription;

  AuthBloc({
    required LoginWithEmailUseCase loginWithEmail,
    required RegisterUseCase register,
    required LoginWithGoogleUseCase loginWithGoogle,
    required LogoutUseCase logout,
    required GetCurrentUserUseCase getCurrentUser,
    required WatchAuthStateUseCase watchAuthState,
  })  : _loginWithEmail = loginWithEmail,
        _register = register,
        _loginWithGoogle = loginWithGoogle,
        _logout = logout,
        _getCurrentUser = getCurrentUser,
        _watchAuthState = watchAuthState,
        super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
    _subscribeToAuthState();
  }

  /// Subscribe to Firebase auth state stream so routing reacts automatically.
  void _subscribeToAuthState() {
    _authSubscription = _watchAuthState().listen((user) {
      final isCurrentlyAuthenticated = state.maybeMap(
        authenticated: (_) => true,
        orElse: () => false,
      );
      final isCurrentlyUnauthenticated = state.maybeMap(
        unauthenticated: (_) => true,
        orElse: () => false,
      );

      if (user != null && !isCurrentlyAuthenticated) {
        add(const AuthEvent.checkAuthStatus());
      } else if (user == null && !isCurrentlyUnauthenticated) {
        add(const AuthEvent.checkAuthStatus());
      }
    });
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      checkAuthStatus: (_) async {
        emit(const AuthState.loading());
        final result = await _getCurrentUser();
        result.fold(
          (failure) => emit(const AuthState.unauthenticated()),
          (user) => user != null
              ? emit(AuthState.authenticated(user: user))
              : emit(const AuthState.unauthenticated()),
        );
      },
      loginWithEmail: (e) async {
        emit(const AuthState.loadingEmail());
        final result = await _loginWithEmail(
          email: e.email,
          password: e.password,
        );
        result.fold(
          (failure) => emit(AuthState.failure(message: failure.message)),
          (user) => emit(AuthState.authenticated(user: user)),
        );
      },
      loginWithGoogle: (e) async {
        emit(const AuthState.loadingGoogle());
        final result = await _loginWithGoogle(role: e.role);
        result.fold(
          (failure) => emit(AuthState.failure(message: failure.message)),
          (user) => emit(AuthState.authenticated(user: user)),
        );
      },
      register: (e) async {
        emit(const AuthState.loading());
        final result = await _register(
          email: e.email,
          password: e.password,
          displayName: e.displayName,
          role: e.role,
        );
        result.fold(
          (failure) => emit(AuthState.failure(message: failure.message)),
          (user) => emit(AuthState.authenticated(user: user)),
        );
      },
      logout: (_) async {
        emit(const AuthState.loading());
        final result = await _logout();
        result.fold(
          (failure) => emit(AuthState.failure(message: failure.message)),
          (_) => emit(const AuthState.unauthenticated()),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}

