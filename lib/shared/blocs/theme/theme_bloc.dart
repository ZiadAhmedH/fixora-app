import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';

part 'theme_bloc.freezed.dart';

// ── Events ────────────────────────────────────────────────────────────────────

@freezed
sealed class ThemeEvent with _$ThemeEvent {
  /// Load persisted theme on app startup.
  const factory ThemeEvent.load() = _Load;

  /// Switch to the light theme.
  const factory ThemeEvent.setLight() = _SetLight;

  /// Switch to the dark theme.
  const factory ThemeEvent.setDark() = _SetDark;

  /// Follow the device system theme.
  const factory ThemeEvent.setSystem() = _SetSystem;

  /// Toggle between light and dark.
  const factory ThemeEvent.toggle() = _Toggle;
}

// ── State ─────────────────────────────────────────────────────────────────────

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _prefs;

  ThemeBloc(this._prefs) : super(const ThemeState()) {
    on<ThemeEvent>((event, emit) async {
      await event.map(
        load: (_) => _onLoad(emit),
        setLight: (_) => _onSetTheme(emit, ThemeMode.light),
        setDark: (_) => _onSetTheme(emit, ThemeMode.dark),
        setSystem: (_) => _onSetTheme(emit, ThemeMode.system),
        toggle: (_) => _onToggle(emit),
      );
    });
  }

  Future<void> _onLoad(Emitter<ThemeState> emit) async {
    final saved = _prefs.getString(AppConstants.themeKey);
    final mode = _themeModeFromString(saved);
    emit(ThemeState(themeMode: mode));
  }

  Future<void> _onSetTheme(Emitter<ThemeState> emit, ThemeMode mode) async {
    await _prefs.setString(AppConstants.themeKey, mode.name);
    emit(ThemeState(themeMode: mode));
  }

  Future<void> _onToggle(Emitter<ThemeState> emit) async {
    final next = state.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await _onSetTheme(emit, next);
  }

  ThemeMode _themeModeFromString(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
