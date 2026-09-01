// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
    ThemeEvent value,
    $Res Function(ThemeEvent) then,
  ) = _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'ThemeEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ThemeEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
abstract class _$$SetLightImplCopyWith<$Res> {
  factory _$$SetLightImplCopyWith(
    _$SetLightImpl value,
    $Res Function(_$SetLightImpl) then,
  ) = __$$SetLightImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetLightImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetLightImpl>
    implements _$$SetLightImplCopyWith<$Res> {
  __$$SetLightImplCopyWithImpl(
    _$SetLightImpl _value,
    $Res Function(_$SetLightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetLightImpl implements _SetLight {
  const _$SetLightImpl();

  @override
  String toString() {
    return 'ThemeEvent.setLight()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetLightImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) {
    return setLight();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) {
    return setLight?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (setLight != null) {
      return setLight();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) {
    return setLight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) {
    return setLight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (setLight != null) {
      return setLight(this);
    }
    return orElse();
  }
}

abstract class _SetLight implements ThemeEvent {
  const factory _SetLight() = _$SetLightImpl;
}

/// @nodoc
abstract class _$$SetDarkImplCopyWith<$Res> {
  factory _$$SetDarkImplCopyWith(
    _$SetDarkImpl value,
    $Res Function(_$SetDarkImpl) then,
  ) = __$$SetDarkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetDarkImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetDarkImpl>
    implements _$$SetDarkImplCopyWith<$Res> {
  __$$SetDarkImplCopyWithImpl(
    _$SetDarkImpl _value,
    $Res Function(_$SetDarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetDarkImpl implements _SetDark {
  const _$SetDarkImpl();

  @override
  String toString() {
    return 'ThemeEvent.setDark()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetDarkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) {
    return setDark();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) {
    return setDark?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (setDark != null) {
      return setDark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) {
    return setDark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) {
    return setDark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (setDark != null) {
      return setDark(this);
    }
    return orElse();
  }
}

abstract class _SetDark implements ThemeEvent {
  const factory _SetDark() = _$SetDarkImpl;
}

/// @nodoc
abstract class _$$SetSystemImplCopyWith<$Res> {
  factory _$$SetSystemImplCopyWith(
    _$SetSystemImpl value,
    $Res Function(_$SetSystemImpl) then,
  ) = __$$SetSystemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetSystemImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetSystemImpl>
    implements _$$SetSystemImplCopyWith<$Res> {
  __$$SetSystemImplCopyWithImpl(
    _$SetSystemImpl _value,
    $Res Function(_$SetSystemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetSystemImpl implements _SetSystem {
  const _$SetSystemImpl();

  @override
  String toString() {
    return 'ThemeEvent.setSystem()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetSystemImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) {
    return setSystem();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) {
    return setSystem?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (setSystem != null) {
      return setSystem();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) {
    return setSystem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) {
    return setSystem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (setSystem != null) {
      return setSystem(this);
    }
    return orElse();
  }
}

abstract class _SetSystem implements ThemeEvent {
  const factory _SetSystem() = _$SetSystemImpl;
}

/// @nodoc
abstract class _$$ToggleImplCopyWith<$Res> {
  factory _$$ToggleImplCopyWith(
    _$ToggleImpl value,
    $Res Function(_$ToggleImpl) then,
  ) = __$$ToggleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ToggleImpl>
    implements _$$ToggleImplCopyWith<$Res> {
  __$$ToggleImplCopyWithImpl(
    _$ToggleImpl _value,
    $Res Function(_$ToggleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleImpl implements _Toggle {
  const _$ToggleImpl();

  @override
  String toString() {
    return 'ThemeEvent.toggle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() setLight,
    required TResult Function() setDark,
    required TResult Function() setSystem,
    required TResult Function() toggle,
  }) {
    return toggle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? setLight,
    TResult? Function()? setDark,
    TResult? Function()? setSystem,
    TResult? Function()? toggle,
  }) {
    return toggle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? setLight,
    TResult Function()? setDark,
    TResult Function()? setSystem,
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_SetLight value) setLight,
    required TResult Function(_SetDark value) setDark,
    required TResult Function(_SetSystem value) setSystem,
    required TResult Function(_Toggle value) toggle,
  }) {
    return toggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_SetLight value)? setLight,
    TResult? Function(_SetDark value)? setDark,
    TResult? Function(_SetSystem value)? setSystem,
    TResult? Function(_Toggle value)? toggle,
  }) {
    return toggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_SetLight value)? setLight,
    TResult Function(_SetDark value)? setDark,
    TResult Function(_SetSystem value)? setSystem,
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(this);
    }
    return orElse();
  }
}

abstract class _Toggle implements ThemeEvent {
  const factory _Toggle() = _$ToggleImpl;
}

/// @nodoc
mixin _$ThemeState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
    ThemeState value,
    $Res Function(ThemeState) then,
  ) = _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeMode = null}) {
    return _then(
      _value.copyWith(
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeMode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeStateImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateImplCopyWith(
    _$ThemeStateImpl value,
    $Res Function(_$ThemeStateImpl) then,
  ) = __$$ThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$ThemeStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateImpl>
    implements _$$ThemeStateImplCopyWith<$Res> {
  __$$ThemeStateImplCopyWithImpl(
    _$ThemeStateImpl _value,
    $Res Function(_$ThemeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeMode = null}) {
    return _then(
      _$ThemeStateImpl(
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
      ),
    );
  }
}

/// @nodoc

class _$ThemeStateImpl implements _ThemeState {
  const _$ThemeStateImpl({this.themeMode = ThemeMode.system});

  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      __$$ThemeStateImplCopyWithImpl<_$ThemeStateImpl>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({final ThemeMode themeMode}) = _$ThemeStateImpl;

  @override
  ThemeMode get themeMode;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
