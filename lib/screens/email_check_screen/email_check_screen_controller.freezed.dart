// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_check_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmailCheckScreenStateTearOff {
  const _$EmailCheckScreenStateTearOff();

  _EmailCheckScreenState call(
      {String email = "",
      String password = "",
      String error = "",
      Routes? from}) {
    return _EmailCheckScreenState(
      email: email,
      password: password,
      error: error,
      from: from,
    );
  }
}

/// @nodoc
const $EmailCheckScreenState = _$EmailCheckScreenStateTearOff();

/// @nodoc
mixin _$EmailCheckScreenState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  Routes? get from => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailCheckScreenStateCopyWith<EmailCheckScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailCheckScreenStateCopyWith<$Res> {
  factory $EmailCheckScreenStateCopyWith(EmailCheckScreenState value,
          $Res Function(EmailCheckScreenState) then) =
      _$EmailCheckScreenStateCopyWithImpl<$Res>;
  $Res call({String email, String password, String error, Routes? from});
}

/// @nodoc
class _$EmailCheckScreenStateCopyWithImpl<$Res>
    implements $EmailCheckScreenStateCopyWith<$Res> {
  _$EmailCheckScreenStateCopyWithImpl(this._value, this._then);

  final EmailCheckScreenState _value;
  // ignore: unused_field
  final $Res Function(EmailCheckScreenState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
    Object? from = freezed,
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
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Routes?,
    ));
  }
}

/// @nodoc
abstract class _$EmailCheckScreenStateCopyWith<$Res>
    implements $EmailCheckScreenStateCopyWith<$Res> {
  factory _$EmailCheckScreenStateCopyWith(_EmailCheckScreenState value,
          $Res Function(_EmailCheckScreenState) then) =
      __$EmailCheckScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, String error, Routes? from});
}

/// @nodoc
class __$EmailCheckScreenStateCopyWithImpl<$Res>
    extends _$EmailCheckScreenStateCopyWithImpl<$Res>
    implements _$EmailCheckScreenStateCopyWith<$Res> {
  __$EmailCheckScreenStateCopyWithImpl(_EmailCheckScreenState _value,
      $Res Function(_EmailCheckScreenState) _then)
      : super(_value, (v) => _then(v as _EmailCheckScreenState));

  @override
  _EmailCheckScreenState get _value => super._value as _EmailCheckScreenState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
    Object? from = freezed,
  }) {
    return _then(_EmailCheckScreenState(
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
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Routes?,
    ));
  }
}

/// @nodoc

class _$_EmailCheckScreenState implements _EmailCheckScreenState {
  const _$_EmailCheckScreenState(
      {this.email = "", this.password = "", this.error = "", this.from});

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
  final Routes? from;

  @override
  String toString() {
    return 'EmailCheckScreenState(email: $email, password: $password, error: $error, from: $from)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailCheckScreenState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.from, from));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(from));

  @JsonKey(ignore: true)
  @override
  _$EmailCheckScreenStateCopyWith<_EmailCheckScreenState> get copyWith =>
      __$EmailCheckScreenStateCopyWithImpl<_EmailCheckScreenState>(
          this, _$identity);
}

abstract class _EmailCheckScreenState implements EmailCheckScreenState {
  const factory _EmailCheckScreenState(
      {String email,
      String password,
      String error,
      Routes? from}) = _$_EmailCheckScreenState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get error;
  @override
  Routes? get from;
  @override
  @JsonKey(ignore: true)
  _$EmailCheckScreenStateCopyWith<_EmailCheckScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
