// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(
    _$CheckAuthStatusImpl value,
    $Res Function(_$CheckAuthStatusImpl) then,
  ) = __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
    _$CheckAuthStatusImpl _value,
    $Res Function(_$CheckAuthStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements _CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthStatus implements AuthEvent {
  const factory _CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$LoginWithEmailImplCopyWith<$Res> {
  factory _$$LoginWithEmailImplCopyWith(
    _$LoginWithEmailImpl value,
    $Res Function(_$LoginWithEmailImpl) then,
  ) = __$$LoginWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginWithEmailImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithEmailImpl>
    implements _$$LoginWithEmailImplCopyWith<$Res> {
  __$$LoginWithEmailImplCopyWithImpl(
    _$LoginWithEmailImpl _value,
    $Res Function(_$LoginWithEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginWithEmailImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginWithEmailImpl implements _LoginWithEmail {
  const _$LoginWithEmailImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithEmailImplCopyWith<_$LoginWithEmailImpl> get copyWith =>
      __$$LoginWithEmailImplCopyWithImpl<_$LoginWithEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) {
    return loginWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) {
    return loginWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loginWithEmail != null) {
      return loginWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) {
    return loginWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) {
    return loginWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (loginWithEmail != null) {
      return loginWithEmail(this);
    }
    return orElse();
  }
}

abstract class _LoginWithEmail implements AuthEvent {
  const factory _LoginWithEmail({
    required final String email,
    required final String password,
  }) = _$LoginWithEmailImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithEmailImplCopyWith<_$LoginWithEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithGoogleImplCopyWith<$Res> {
  factory _$$LoginWithGoogleImplCopyWith(
    _$LoginWithGoogleImpl value,
    $Res Function(_$LoginWithGoogleImpl) then,
  ) = __$$LoginWithGoogleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRole? role});
}

/// @nodoc
class __$$LoginWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithGoogleImpl>
    implements _$$LoginWithGoogleImplCopyWith<$Res> {
  __$$LoginWithGoogleImplCopyWithImpl(
    _$LoginWithGoogleImpl _value,
    $Res Function(_$LoginWithGoogleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = freezed}) {
    return _then(
      _$LoginWithGoogleImpl(
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole?,
      ),
    );
  }
}

/// @nodoc

class _$LoginWithGoogleImpl implements _LoginWithGoogle {
  const _$LoginWithGoogleImpl({this.role});

  @override
  final UserRole? role;

  @override
  String toString() {
    return 'AuthEvent.loginWithGoogle(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithGoogleImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithGoogleImplCopyWith<_$LoginWithGoogleImpl> get copyWith =>
      __$$LoginWithGoogleImplCopyWithImpl<_$LoginWithGoogleImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) {
    return loginWithGoogle(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) {
    return loginWithGoogle?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) {
    return loginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) {
    return loginWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoginWithGoogle implements AuthEvent {
  const factory _LoginWithGoogle({final UserRole? role}) =
      _$LoginWithGoogleImpl;

  UserRole? get role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithGoogleImplCopyWith<_$LoginWithGoogleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
    _$RegisterImpl value,
    $Res Function(_$RegisterImpl) then,
  ) = __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String displayName, UserRole role});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
    _$RegisterImpl _value,
    $Res Function(_$RegisterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
    Object? role = null,
  }) {
    return _then(
      _$RegisterImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
      ),
    );
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl({
    required this.email,
    required this.password,
    required this.displayName,
    required this.role,
  });

  @override
  final String email;
  @override
  final String password;
  @override
  final String displayName;
  @override
  final UserRole role;

  @override
  String toString() {
    return 'AuthEvent.register(email: $email, password: $password, displayName: $displayName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, displayName, role);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) {
    return register(email, password, displayName, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) {
    return register?.call(email, password, displayName, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password, displayName, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AuthEvent {
  const factory _Register({
    required final String email,
    required final String password,
    required final String displayName,
    required final UserRole role,
  }) = _$RegisterImpl;

  String get email;
  String get password;
  String get displayName;
  UserRole get role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
    _$LogoutImpl value,
    $Res Function(_$LogoutImpl) then,
  ) = __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
    _$LogoutImpl _value,
    $Res Function(_$LogoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(UserRole? role) loginWithGoogle,
    required TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )
    register,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(UserRole? role)? loginWithGoogle,
    TResult? Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(UserRole? role)? loginWithGoogle,
    TResult Function(
      String email,
      String password,
      String displayName,
      UserRole role,
    )?
    register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}
