// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginScreenStateTearOff {
  const _$LoginScreenStateTearOff();

  _LoginScreenState call(
      {String email = "", String password = "", String error = ""}) {
    return _LoginScreenState(
      email: email,
      password: password,
      error: error,
    );
  }
}

/// @nodoc
const $LoginScreenState = _$LoginScreenStateTearOff();

/// @nodoc
mixin _$LoginScreenState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res>;
  $Res call({String email, String password, String error});
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  final LoginScreenState _value;
  // ignore: unused_field
  final $Res Function(LoginScreenState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginScreenStateCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$LoginScreenStateCopyWith(
          _LoginScreenState value, $Res Function(_LoginScreenState) then) =
      __$LoginScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, String error});
}

/// @nodoc
class __$LoginScreenStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateCopyWith<$Res> {
  __$LoginScreenStateCopyWithImpl(
      _LoginScreenState _value, $Res Function(_LoginScreenState) _then)
      : super(_value, (v) => _then(v as _LoginScreenState));

  @override
  _LoginScreenState get _value => super._value as _LoginScreenState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
  }) {
    return _then(_LoginScreenState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginScreenState implements _LoginScreenState {
  const _$_LoginScreenState(
      {this.email = "", this.password = "", this.error = ""});

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final String password;
  @JsonKey()
  @override
  final String error;

  @override
  String toString() {
    return 'LoginScreenState(email: $email, password: $password, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginScreenState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$LoginScreenStateCopyWith<_LoginScreenState> get copyWith =>
      __$LoginScreenStateCopyWithImpl<_LoginScreenState>(this, _$identity);
}

abstract class _LoginScreenState implements LoginScreenState {
  const factory _LoginScreenState(
      {String email, String password, String error}) = _$_LoginScreenState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$LoginScreenStateCopyWith<_LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
