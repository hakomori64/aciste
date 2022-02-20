// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageScreenStateTearOff {
  const _$MessageScreenStateTearOff();

  _MessageScreenState call(
      {ResourceType? resourceType,
      String text = "",
      Future<void> Function(String)? onTapFunc}) {
    return _MessageScreenState(
      resourceType: resourceType,
      text: text,
      onTapFunc: onTapFunc,
    );
  }
}

/// @nodoc
const $MessageScreenState = _$MessageScreenStateTearOff();

/// @nodoc
mixin _$MessageScreenState {
  ResourceType? get resourceType => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Future<void> Function(String)? get onTapFunc =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageScreenStateCopyWith<MessageScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageScreenStateCopyWith<$Res> {
  factory $MessageScreenStateCopyWith(
          MessageScreenState value, $Res Function(MessageScreenState) then) =
      _$MessageScreenStateCopyWithImpl<$Res>;
  $Res call(
      {ResourceType? resourceType,
      String text,
      Future<void> Function(String)? onTapFunc});
}

/// @nodoc
class _$MessageScreenStateCopyWithImpl<$Res>
    implements $MessageScreenStateCopyWith<$Res> {
  _$MessageScreenStateCopyWithImpl(this._value, this._then);

  final MessageScreenState _value;
  // ignore: unused_field
  final $Res Function(MessageScreenState) _then;

  @override
  $Res call({
    Object? resourceType = freezed,
    Object? text = freezed,
    Object? onTapFunc = freezed,
  }) {
    return _then(_value.copyWith(
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      onTapFunc: onTapFunc == freezed
          ? _value.onTapFunc
          : onTapFunc // ignore: cast_nullable_to_non_nullable
              as Future<void> Function(String)?,
    ));
  }
}

/// @nodoc
abstract class _$MessageScreenStateCopyWith<$Res>
    implements $MessageScreenStateCopyWith<$Res> {
  factory _$MessageScreenStateCopyWith(
          _MessageScreenState value, $Res Function(_MessageScreenState) then) =
      __$MessageScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ResourceType? resourceType,
      String text,
      Future<void> Function(String)? onTapFunc});
}

/// @nodoc
class __$MessageScreenStateCopyWithImpl<$Res>
    extends _$MessageScreenStateCopyWithImpl<$Res>
    implements _$MessageScreenStateCopyWith<$Res> {
  __$MessageScreenStateCopyWithImpl(
      _MessageScreenState _value, $Res Function(_MessageScreenState) _then)
      : super(_value, (v) => _then(v as _MessageScreenState));

  @override
  _MessageScreenState get _value => super._value as _MessageScreenState;

  @override
  $Res call({
    Object? resourceType = freezed,
    Object? text = freezed,
    Object? onTapFunc = freezed,
  }) {
    return _then(_MessageScreenState(
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      onTapFunc: onTapFunc == freezed
          ? _value.onTapFunc
          : onTapFunc // ignore: cast_nullable_to_non_nullable
              as Future<void> Function(String)?,
    ));
  }
}

/// @nodoc

class _$_MessageScreenState implements _MessageScreenState {
  const _$_MessageScreenState(
      {this.resourceType, this.text = "", this.onTapFunc});

  @override
  final ResourceType? resourceType;
  @JsonKey()
  @override
  final String text;
  @override
  final Future<void> Function(String)? onTapFunc;

  @override
  String toString() {
    return 'MessageScreenState(resourceType: $resourceType, text: $text, onTapFunc: $onTapFunc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageScreenState &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            (identical(other.onTapFunc, onTapFunc) ||
                other.onTapFunc == onTapFunc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(text),
      onTapFunc);

  @JsonKey(ignore: true)
  @override
  _$MessageScreenStateCopyWith<_MessageScreenState> get copyWith =>
      __$MessageScreenStateCopyWithImpl<_MessageScreenState>(this, _$identity);
}

abstract class _MessageScreenState implements MessageScreenState {
  const factory _MessageScreenState(
      {ResourceType? resourceType,
      String text,
      Future<void> Function(String)? onTapFunc}) = _$_MessageScreenState;

  @override
  ResourceType? get resourceType;
  @override
  String get text;
  @override
  Future<void> Function(String)? get onTapFunc;
  @override
  @JsonKey(ignore: true)
  _$MessageScreenStateCopyWith<_MessageScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
