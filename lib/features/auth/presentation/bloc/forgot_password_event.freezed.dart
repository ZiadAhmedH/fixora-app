// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetMethod method) methodChanged,
    required TResult Function(String email) sendRequested,
    required TResult Function() resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetMethod method)? methodChanged,
    TResult? Function(String email)? sendRequested,
    TResult? Function()? resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetMethod method)? methodChanged,
    TResult Function(String email)? sendRequested,
    TResult Function()? resetState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MethodChanged value) methodChanged,
    required TResult Function(_SendRequested value) sendRequested,
    required TResult Function(_ResetState value) resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MethodChanged value)? methodChanged,
    TResult? Function(_SendRequested value)? sendRequested,
    TResult? Function(_ResetState value)? resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MethodChanged value)? methodChanged,
    TResult Function(_SendRequested value)? sendRequested,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
    ForgotPasswordEvent value,
    $Res Function(ForgotPasswordEvent) then,
  ) = _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MethodChangedImplCopyWith<$Res> {
  factory _$$MethodChangedImplCopyWith(
    _$MethodChangedImpl value,
    $Res Function(_$MethodChangedImpl) then,
  ) = __$$MethodChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetMethod method});
}

/// @nodoc
class __$$MethodChangedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$MethodChangedImpl>
    implements _$$MethodChangedImplCopyWith<$Res> {
  __$$MethodChangedImplCopyWithImpl(
    _$MethodChangedImpl _value,
    $Res Function(_$MethodChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? method = null}) {
    return _then(
      _$MethodChangedImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as ResetMethod,
      ),
    );
  }
}

/// @nodoc

class _$MethodChangedImpl implements _MethodChanged {
  const _$MethodChangedImpl({required this.method});

  @override
  final ResetMethod method;

  @override
  String toString() {
    return 'ForgotPasswordEvent.methodChanged(method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MethodChangedImpl &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MethodChangedImplCopyWith<_$MethodChangedImpl> get copyWith =>
      __$$MethodChangedImplCopyWithImpl<_$MethodChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetMethod method) methodChanged,
    required TResult Function(String email) sendRequested,
    required TResult Function() resetState,
  }) {
    return methodChanged(method);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetMethod method)? methodChanged,
    TResult? Function(String email)? sendRequested,
    TResult? Function()? resetState,
  }) {
    return methodChanged?.call(method);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetMethod method)? methodChanged,
    TResult Function(String email)? sendRequested,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (methodChanged != null) {
      return methodChanged(method);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MethodChanged value) methodChanged,
    required TResult Function(_SendRequested value) sendRequested,
    required TResult Function(_ResetState value) resetState,
  }) {
    return methodChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MethodChanged value)? methodChanged,
    TResult? Function(_SendRequested value)? sendRequested,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return methodChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MethodChanged value)? methodChanged,
    TResult Function(_SendRequested value)? sendRequested,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (methodChanged != null) {
      return methodChanged(this);
    }
    return orElse();
  }
}

abstract class _MethodChanged implements ForgotPasswordEvent {
  const factory _MethodChanged({required final ResetMethod method}) =
      _$MethodChangedImpl;

  ResetMethod get method;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MethodChangedImplCopyWith<_$MethodChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendRequestedImplCopyWith<$Res> {
  factory _$$SendRequestedImplCopyWith(
    _$SendRequestedImpl value,
    $Res Function(_$SendRequestedImpl) then,
  ) = __$$SendRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendRequestedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SendRequestedImpl>
    implements _$$SendRequestedImplCopyWith<$Res> {
  __$$SendRequestedImplCopyWithImpl(
    _$SendRequestedImpl _value,
    $Res Function(_$SendRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$SendRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SendRequestedImpl implements _SendRequested {
  const _$SendRequestedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.sendRequested(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendRequestedImplCopyWith<_$SendRequestedImpl> get copyWith =>
      __$$SendRequestedImplCopyWithImpl<_$SendRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetMethod method) methodChanged,
    required TResult Function(String email) sendRequested,
    required TResult Function() resetState,
  }) {
    return sendRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetMethod method)? methodChanged,
    TResult? Function(String email)? sendRequested,
    TResult? Function()? resetState,
  }) {
    return sendRequested?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetMethod method)? methodChanged,
    TResult Function(String email)? sendRequested,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (sendRequested != null) {
      return sendRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MethodChanged value) methodChanged,
    required TResult Function(_SendRequested value) sendRequested,
    required TResult Function(_ResetState value) resetState,
  }) {
    return sendRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MethodChanged value)? methodChanged,
    TResult? Function(_SendRequested value)? sendRequested,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return sendRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MethodChanged value)? methodChanged,
    TResult Function(_SendRequested value)? sendRequested,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (sendRequested != null) {
      return sendRequested(this);
    }
    return orElse();
  }
}

abstract class _SendRequested implements ForgotPasswordEvent {
  const factory _SendRequested({required final String email}) =
      _$SendRequestedImpl;

  String get email;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendRequestedImplCopyWith<_$SendRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetStateImplCopyWith<$Res> {
  factory _$$ResetStateImplCopyWith(
    _$ResetStateImpl value,
    $Res Function(_$ResetStateImpl) then,
  ) = __$$ResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ResetStateImpl>
    implements _$$ResetStateImplCopyWith<$Res> {
  __$$ResetStateImplCopyWithImpl(
    _$ResetStateImpl _value,
    $Res Function(_$ResetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetStateImpl implements _ResetState {
  const _$ResetStateImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetMethod method) methodChanged,
    required TResult Function(String email) sendRequested,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetMethod method)? methodChanged,
    TResult? Function(String email)? sendRequested,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetMethod method)? methodChanged,
    TResult Function(String email)? sendRequested,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MethodChanged value) methodChanged,
    required TResult Function(_SendRequested value) sendRequested,
    required TResult Function(_ResetState value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MethodChanged value)? methodChanged,
    TResult? Function(_SendRequested value)? sendRequested,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MethodChanged value)? methodChanged,
    TResult Function(_SendRequested value)? sendRequested,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements ForgotPasswordEvent {
  const factory _ResetState() = _$ResetStateImpl;
}
