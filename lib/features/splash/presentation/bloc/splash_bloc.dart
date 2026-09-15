import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/check_auth_status_use_case.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthStatusUseCase _checkAuthStatus;

  SplashBloc({required CheckAuthStatusUseCase checkAuthStatus})
      : _checkAuthStatus = checkAuthStatus,
        super(const SplashState.initial()) {
    on<SplashEvent>(_onEvent);
  }

  Future<void> _onEvent(SplashEvent event, Emitter<SplashState> emit) async {
    await event.map(
      started: (_) async {
        final user = await _checkAuthStatus();
        if (user != null) {
          emit(const SplashState.authenticated());
        } else {
          emit(const SplashState.unauthenticated());
        }
      },
    );
  }
}
