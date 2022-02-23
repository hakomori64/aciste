// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignupScreenStateTearOff {
  const _$SignupScreenStateTearOff();

  _SignupScreenState call(
      {String email = "",
      String password = "",
      String confirmPassword = "",
      String error = ""}) {
    return _SignupScreenState(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      error: error,
    );
  }
}

/// @nodoc
const $SignupScreenState = _$SignupScreenStateTearOff();

/// @nodoc
mixin _$SignupScreenState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupScreenStateCopyWith<SignupScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupScreenStateCopyWith<$Res> {
  factory $SignupScreenStateCopyWith(
          SignupScreenState value, $Res Function(SignupScreenState) then) =
      _$SignupScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String email, String password, String confirmPassword, String error});
}

/// @nodoc
class _$SignupScreenStateCopyWithImpl<$Res>
    implements $SignupScreenStateCopyWith<$Res> {
  _$SignupScreenStateCopyWithImpl(this._value, this._then);

  final SignupScreenState _value;
  // ignore: unused_field
  final $Res Function(SignupScreenState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
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
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignupScreenStateCopyWith<$Res>
    implements $SignupScreenStateCopyWith<$Res> {
  factory _$SignupScreenStateCopyWith(
          _SignupScreenState value, $Res Function(_SignupScreenState) then) =
      __$SignupScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email, String password, String confirmPassword, String error});
}

/// @nodoc
class __$SignupScreenStateCopyWithImpl<$Res>
    extends _$SignupScreenStateCopyWithImpl<$Res>
    implements _$SignupScreenStateCopyWith<$Res> {
  __$SignupScreenStateCopyWithImpl(
      _SignupScreenState _value, $Res Function(_SignupScreenState) _then)
      : super(_value, (v) => _then(v as _SignupScreenState));

  @override
  _SignupScreenState get _value => super._value as _SignupScreenState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? error = freezed,
  }) {
    return _then(_SignupScreenState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignupScreenState implements _SignupScreenState {
  const _$_SignupScreenState(
      {this.email = "",
      this.password = "",
      this.confirmPassword = "",
      this.error = ""});

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final String password;
  @JsonKey()
  @override
  final String confirmPassword;
  @JsonKey()
  @override
  final String error;

  @override
  String toString() {
    return 'SignupScreenState(email: $email, password: $password, confirmPassword: $confirmPassword, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupScreenState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$SignupScreenStateCopyWith<_SignupScreenState> get copyWith =>
      __$SignupScreenStateCopyWithImpl<_SignupScreenState>(this, _$identity);
}

abstract class _SignupScreenState implements SignupScreenState {
  const factory _SignupScreenState(
      {String email,
      String password,
      String confirmPassword,
      String error}) = _$_SignupScreenState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$SignupScreenStateCopyWith<_SignupScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
