// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SetPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String oobCode) started,
    required TResult Function(String password, String confirm) passwordChanged,
    required TResult Function(String password, String confirm) submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String oobCode)? started,
    TResult? Function(String password, String confirm)? passwordChanged,
    TResult? Function(String password, String confirm)? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String oobCode)? started,
    TResult Function(String password, String confirm)? passwordChanged,
    TResult Function(String password, String confirm)? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Submitted value)? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPasswordEventCopyWith<$Res> {
  factory $SetPasswordEventCopyWith(
    SetPasswordEvent value,
    $Res Function(SetPasswordEvent) then,
  ) = _$SetPasswordEventCopyWithImpl<$Res, SetPasswordEvent>;
}

/// @nodoc
class _$SetPasswordEventCopyWithImpl<$Res, $Val extends SetPasswordEvent>
    implements $SetPasswordEventCopyWith<$Res> {
  _$SetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oobCode});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SetPasswordEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oobCode = null}) {
    return _then(
      _$StartedImpl(
        oobCode: null == oobCode
            ? _value.oobCode
            : oobCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl({required this.oobCode});

  @override
  final String oobCode;

  @override
  String toString() {
    return 'SetPasswordEvent.started(oobCode: $oobCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.oobCode, oobCode) || other.oobCode == oobCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oobCode);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String oobCode) started,
    required TResult Function(String password, String confirm) passwordChanged,
    required TResult Function(String password, String confirm) submitted,
  }) {
    return started(oobCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String oobCode)? started,
    TResult? Function(String password, String confirm)? passwordChanged,
    TResult? Function(String password, String confirm)? submitted,
  }) {
    return started?.call(oobCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String oobCode)? started,
    TResult Function(String password, String confirm)? passwordChanged,
    TResult Function(String password, String confirm)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(oobCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SetPasswordEvent {
  const factory _Started({required final String oobCode}) = _$StartedImpl;

  String get oobCode;

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(
    _$PasswordChangedImpl value,
    $Res Function(_$PasswordChangedImpl) then,
  ) = __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirm});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$SetPasswordEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
    _$PasswordChangedImpl _value,
    $Res Function(_$PasswordChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null, Object? confirm = null}) {
    return _then(
      _$PasswordChangedImpl(
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirm: null == confirm
            ? _value.confirm
            : confirm // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordChangedImpl implements _PasswordChanged {
  const _$PasswordChangedImpl({required this.password, required this.confirm});

  @override
  final String password;
  @override
  final String confirm;

  @override
  String toString() {
    return 'SetPasswordEvent.passwordChanged(password: $password, confirm: $confirm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirm, confirm) || other.confirm == confirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirm);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String oobCode) started,
    required TResult Function(String password, String confirm) passwordChanged,
    required TResult Function(String password, String confirm) submitted,
  }) {
    return passwordChanged(password, confirm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String oobCode)? started,
    TResult? Function(String password, String confirm)? passwordChanged,
    TResult? Function(String password, String confirm)? submitted,
  }) {
    return passwordChanged?.call(password, confirm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String oobCode)? started,
    TResult Function(String password, String confirm)? passwordChanged,
    TResult Function(String password, String confirm)? submitted,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password, confirm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SetPasswordEvent {
  const factory _PasswordChanged({
    required final String password,
    required final String confirm,
  }) = _$PasswordChangedImpl;

  String get password;
  String get confirm;

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
    _$SubmittedImpl value,
    $Res Function(_$SubmittedImpl) then,
  ) = __$$SubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirm});
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$SetPasswordEventCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
    _$SubmittedImpl _value,
    $Res Function(_$SubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null, Object? confirm = null}) {
    return _then(
      _$SubmittedImpl(
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirm: null == confirm
            ? _value.confirm
            : confirm // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl({required this.password, required this.confirm});

  @override
  final String password;
  @override
  final String confirm;

  @override
  String toString() {
    return 'SetPasswordEvent.submitted(password: $password, confirm: $confirm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmittedImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirm, confirm) || other.confirm == confirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirm);

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmittedImplCopyWith<_$SubmittedImpl> get copyWith =>
      __$$SubmittedImplCopyWithImpl<_$SubmittedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String oobCode) started,
    required TResult Function(String password, String confirm) passwordChanged,
    required TResult Function(String password, String confirm) submitted,
  }) {
    return submitted(password, confirm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String oobCode)? started,
    TResult? Function(String password, String confirm)? passwordChanged,
    TResult? Function(String password, String confirm)? submitted,
  }) {
    return submitted?.call(password, confirm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String oobCode)? started,
    TResult Function(String password, String confirm)? passwordChanged,
    TResult Function(String password, String confirm)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(password, confirm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements SetPasswordEvent {
  const factory _Submitted({
    required final String password,
    required final String confirm,
  }) = _$SubmittedImpl;

  String get password;
  String get confirm;

  /// Create a copy of SetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmittedImplCopyWith<_$SubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
