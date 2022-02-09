// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qrcode_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QRCodeScreenStateTearOff {
  const _$QRCodeScreenStateTearOff();

  _QRCodeScreenState call({String? url}) {
    return _QRCodeScreenState(
      url: url,
    );
  }
}

/// @nodoc
const $QRCodeScreenState = _$QRCodeScreenStateTearOff();

/// @nodoc
mixin _$QRCodeScreenState {
  String? get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRCodeScreenStateCopyWith<QRCodeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRCodeScreenStateCopyWith<$Res> {
  factory $QRCodeScreenStateCopyWith(
          QRCodeScreenState value, $Res Function(QRCodeScreenState) then) =
      _$QRCodeScreenStateCopyWithImpl<$Res>;
  $Res call({String? url});
}

/// @nodoc
class _$QRCodeScreenStateCopyWithImpl<$Res>
    implements $QRCodeScreenStateCopyWith<$Res> {
  _$QRCodeScreenStateCopyWithImpl(this._value, this._then);

  final QRCodeScreenState _value;
  // ignore: unused_field
  final $Res Function(QRCodeScreenState) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QRCodeScreenStateCopyWith<$Res>
    implements $QRCodeScreenStateCopyWith<$Res> {
  factory _$QRCodeScreenStateCopyWith(
          _QRCodeScreenState value, $Res Function(_QRCodeScreenState) then) =
      __$QRCodeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String? url});
}

/// @nodoc
class __$QRCodeScreenStateCopyWithImpl<$Res>
    extends _$QRCodeScreenStateCopyWithImpl<$Res>
    implements _$QRCodeScreenStateCopyWith<$Res> {
  __$QRCodeScreenStateCopyWithImpl(
      _QRCodeScreenState _value, $Res Function(_QRCodeScreenState) _then)
      : super(_value, (v) => _then(v as _QRCodeScreenState));

  @override
  _QRCodeScreenState get _value => super._value as _QRCodeScreenState;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_QRCodeScreenState(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_QRCodeScreenState implements _QRCodeScreenState {
  const _$_QRCodeScreenState({this.url});

  @override
  final String? url;

  @override
  String toString() {
    return 'QRCodeScreenState(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QRCodeScreenState &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$QRCodeScreenStateCopyWith<_QRCodeScreenState> get copyWith =>
      __$QRCodeScreenStateCopyWithImpl<_QRCodeScreenState>(this, _$identity);
}

abstract class _QRCodeScreenState implements QRCodeScreenState {
  const factory _QRCodeScreenState({String? url}) = _$_QRCodeScreenState;

  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$QRCodeScreenStateCopyWith<_QRCodeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
