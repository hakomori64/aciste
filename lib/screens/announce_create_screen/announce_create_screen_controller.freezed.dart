// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announce_create_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnnounceCreateScreenStateTearOff {
  const _$AnnounceCreateScreenStateTearOff();

  _AnnounceCreateState call(
      {String message = "", AnnounceType announceType = AnnounceType.other}) {
    return _AnnounceCreateState(
      message: message,
      announceType: announceType,
    );
  }
}

/// @nodoc
const $AnnounceCreateScreenState = _$AnnounceCreateScreenStateTearOff();

/// @nodoc
mixin _$AnnounceCreateScreenState {
  String get message => throw _privateConstructorUsedError;
  AnnounceType get announceType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnounceCreateScreenStateCopyWith<AnnounceCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnounceCreateScreenStateCopyWith<$Res> {
  factory $AnnounceCreateScreenStateCopyWith(AnnounceCreateScreenState value,
          $Res Function(AnnounceCreateScreenState) then) =
      _$AnnounceCreateScreenStateCopyWithImpl<$Res>;
  $Res call({String message, AnnounceType announceType});
}

/// @nodoc
class _$AnnounceCreateScreenStateCopyWithImpl<$Res>
    implements $AnnounceCreateScreenStateCopyWith<$Res> {
  _$AnnounceCreateScreenStateCopyWithImpl(this._value, this._then);

  final AnnounceCreateScreenState _value;
  // ignore: unused_field
  final $Res Function(AnnounceCreateScreenState) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? announceType = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      announceType: announceType == freezed
          ? _value.announceType
          : announceType // ignore: cast_nullable_to_non_nullable
              as AnnounceType,
    ));
  }
}

/// @nodoc
abstract class _$AnnounceCreateStateCopyWith<$Res>
    implements $AnnounceCreateScreenStateCopyWith<$Res> {
  factory _$AnnounceCreateStateCopyWith(_AnnounceCreateState value,
          $Res Function(_AnnounceCreateState) then) =
      __$AnnounceCreateStateCopyWithImpl<$Res>;
  @override
  $Res call({String message, AnnounceType announceType});
}

/// @nodoc
class __$AnnounceCreateStateCopyWithImpl<$Res>
    extends _$AnnounceCreateScreenStateCopyWithImpl<$Res>
    implements _$AnnounceCreateStateCopyWith<$Res> {
  __$AnnounceCreateStateCopyWithImpl(
      _AnnounceCreateState _value, $Res Function(_AnnounceCreateState) _then)
      : super(_value, (v) => _then(v as _AnnounceCreateState));

  @override
  _AnnounceCreateState get _value => super._value as _AnnounceCreateState;

  @override
  $Res call({
    Object? message = freezed,
    Object? announceType = freezed,
  }) {
    return _then(_AnnounceCreateState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      announceType: announceType == freezed
          ? _value.announceType
          : announceType // ignore: cast_nullable_to_non_nullable
              as AnnounceType,
    ));
  }
}

/// @nodoc

class _$_AnnounceCreateState implements _AnnounceCreateState {
  const _$_AnnounceCreateState(
      {this.message = "", this.announceType = AnnounceType.other});

  @JsonKey()
  @override
  final String message;
  @JsonKey()
  @override
  final AnnounceType announceType;

  @override
  String toString() {
    return 'AnnounceCreateScreenState(message: $message, announceType: $announceType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnnounceCreateState &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.announceType, announceType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(announceType));

  @JsonKey(ignore: true)
  @override
  _$AnnounceCreateStateCopyWith<_AnnounceCreateState> get copyWith =>
      __$AnnounceCreateStateCopyWithImpl<_AnnounceCreateState>(
          this, _$identity);
}

abstract class _AnnounceCreateState implements AnnounceCreateScreenState {
  const factory _AnnounceCreateState(
      {String message, AnnounceType announceType}) = _$_AnnounceCreateState;

  @override
  String get message;
  @override
  AnnounceType get announceType;
  @override
  @JsonKey(ignore: true)
  _$AnnounceCreateStateCopyWith<_AnnounceCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}
