import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';

part 'locale_bloc.freezed.dart';

// ── Events ────────────────────────────────────────────────────────────────────

@freezed
sealed class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.load() = _Load;

  const factory LocaleEvent.change({required String languageCode}) = _Change;
}

// ── State ─────────────────────────────────────────────────────────────────────

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({@Default(Locale('en')) Locale locale}) =
      _LocaleState;
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final SharedPreferences _prefs;

  LocaleBloc(this._prefs) : super(const LocaleState()) {
    on<LocaleEvent>((event, emit) async {
      await event.map(
        load: (_) => _onLoad(emit),
        change: (e) => _onChange(emit, e.languageCode),
      );
    });
  }

  Future<void> _onLoad(Emitter<LocaleState> emit) async {
    final saved = _prefs.getString(AppConstants.localeKey);
    final locale = Locale(saved ?? AppConstants.defaultLocale);
    emit(LocaleState(locale: locale));
  }

  Future<void> _onChange(Emitter<LocaleState> emit, String languageCode) async {
    await _prefs.setString(AppConstants.localeKey, languageCode);
    emit(LocaleState(locale: Locale(languageCode)));
  }
}
