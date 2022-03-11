// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_create_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemCreateScreenStateTearOff {
  const _$ItemCreateScreenStateTearOff();

  _ItemCreateScreenState call(
      {ResourceType? resourceType, CreateResourceParams? params}) {
    return _ItemCreateScreenState(
      resourceType: resourceType,
      params: params,
    );
  }
}

/// @nodoc
const $ItemCreateScreenState = _$ItemCreateScreenStateTearOff();

/// @nodoc
mixin _$ItemCreateScreenState {
  ResourceType? get resourceType => throw _privateConstructorUsedError;
  CreateResourceParams? get params => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemCreateScreenStateCopyWith<ItemCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCreateScreenStateCopyWith<$Res> {
  factory $ItemCreateScreenStateCopyWith(ItemCreateScreenState value,
          $Res Function(ItemCreateScreenState) then) =
      _$ItemCreateScreenStateCopyWithImpl<$Res>;
  $Res call({ResourceType? resourceType, CreateResourceParams? params});
}

/// @nodoc
class _$ItemCreateScreenStateCopyWithImpl<$Res>
    implements $ItemCreateScreenStateCopyWith<$Res> {
  _$ItemCreateScreenStateCopyWithImpl(this._value, this._then);

  final ItemCreateScreenState _value;
  // ignore: unused_field
  final $Res Function(ItemCreateScreenState) _then;

  @override
  $Res call({
    Object? resourceType = freezed,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as CreateResourceParams?,
    ));
  }
}

/// @nodoc
abstract class _$ItemCreateScreenStateCopyWith<$Res>
    implements $ItemCreateScreenStateCopyWith<$Res> {
  factory _$ItemCreateScreenStateCopyWith(_ItemCreateScreenState value,
          $Res Function(_ItemCreateScreenState) then) =
      __$ItemCreateScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({ResourceType? resourceType, CreateResourceParams? params});
}

/// @nodoc
class __$ItemCreateScreenStateCopyWithImpl<$Res>
    extends _$ItemCreateScreenStateCopyWithImpl<$Res>
    implements _$ItemCreateScreenStateCopyWith<$Res> {
  __$ItemCreateScreenStateCopyWithImpl(_ItemCreateScreenState _value,
      $Res Function(_ItemCreateScreenState) _then)
      : super(_value, (v) => _then(v as _ItemCreateScreenState));

  @override
  _ItemCreateScreenState get _value => super._value as _ItemCreateScreenState;

  @override
  $Res call({
    Object? resourceType = freezed,
    Object? params = freezed,
  }) {
    return _then(_ItemCreateScreenState(
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as CreateResourceParams?,
    ));
  }
}

/// @nodoc

class _$_ItemCreateScreenState implements _ItemCreateScreenState {
  const _$_ItemCreateScreenState({this.resourceType, this.params});

  @override
  final ResourceType? resourceType;
  @override
  final CreateResourceParams? params;

  @override
  String toString() {
    return 'ItemCreateScreenState(resourceType: $resourceType, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemCreateScreenState &&
            const DeepCollectionEquality()
                .equals(other.resourceType, resourceType) &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(resourceType),
      const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$ItemCreateScreenStateCopyWith<_ItemCreateScreenState> get copyWith =>
      __$ItemCreateScreenStateCopyWithImpl<_ItemCreateScreenState>(
          this, _$identity);
}

abstract class _ItemCreateScreenState implements ItemCreateScreenState {
  const factory _ItemCreateScreenState(
      {ResourceType? resourceType,
      CreateResourceParams? params}) = _$_ItemCreateScreenState;

  @override
  ResourceType? get resourceType;
  @override
  CreateResourceParams? get params;
  @override
  @JsonKey(ignore: true)
  _$ItemCreateScreenStateCopyWith<_ItemCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
