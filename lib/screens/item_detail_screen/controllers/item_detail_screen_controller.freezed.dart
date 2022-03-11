// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_detail_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemDetailScreenStateTearOff {
  const _$ItemDetailScreenStateTearOff();

  _ItemDetailScreenState call({Item? item}) {
    return _ItemDetailScreenState(
      item: item,
    );
  }
}

/// @nodoc
const $ItemDetailScreenState = _$ItemDetailScreenStateTearOff();

/// @nodoc
mixin _$ItemDetailScreenState {
  Item? get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemDetailScreenStateCopyWith<ItemDetailScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailScreenStateCopyWith<$Res> {
  factory $ItemDetailScreenStateCopyWith(ItemDetailScreenState value,
          $Res Function(ItemDetailScreenState) then) =
      _$ItemDetailScreenStateCopyWithImpl<$Res>;
  $Res call({Item? item});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$ItemDetailScreenStateCopyWithImpl<$Res>
    implements $ItemDetailScreenStateCopyWith<$Res> {
  _$ItemDetailScreenStateCopyWithImpl(this._value, this._then);

  final ItemDetailScreenState _value;
  // ignore: unused_field
  final $Res Function(ItemDetailScreenState) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ));
  }

  @override
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$ItemDetailScreenStateCopyWith<$Res>
    implements $ItemDetailScreenStateCopyWith<$Res> {
  factory _$ItemDetailScreenStateCopyWith(_ItemDetailScreenState value,
          $Res Function(_ItemDetailScreenState) then) =
      __$ItemDetailScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({Item? item});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$ItemDetailScreenStateCopyWithImpl<$Res>
    extends _$ItemDetailScreenStateCopyWithImpl<$Res>
    implements _$ItemDetailScreenStateCopyWith<$Res> {
  __$ItemDetailScreenStateCopyWithImpl(_ItemDetailScreenState _value,
      $Res Function(_ItemDetailScreenState) _then)
      : super(_value, (v) => _then(v as _ItemDetailScreenState));

  @override
  _ItemDetailScreenState get _value => super._value as _ItemDetailScreenState;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_ItemDetailScreenState(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ));
  }
}

/// @nodoc

class _$_ItemDetailScreenState implements _ItemDetailScreenState {
  const _$_ItemDetailScreenState({this.item});

  @override
  final Item? item;

  @override
  String toString() {
    return 'ItemDetailScreenState(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemDetailScreenState &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$ItemDetailScreenStateCopyWith<_ItemDetailScreenState> get copyWith =>
      __$ItemDetailScreenStateCopyWithImpl<_ItemDetailScreenState>(
          this, _$identity);
}

abstract class _ItemDetailScreenState implements ItemDetailScreenState {
  const factory _ItemDetailScreenState({Item? item}) = _$_ItemDetailScreenState;

  @override
  Item? get item;
  @override
  @JsonKey(ignore: true)
  _$ItemDetailScreenStateCopyWith<_ItemDetailScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
