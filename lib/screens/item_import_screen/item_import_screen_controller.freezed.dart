// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_import_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemImportScreenStateTearOff {
  const _$ItemImportScreenStateTearOff();

  _ItemImportScreenState call({Item? item}) {
    return _ItemImportScreenState(
      item: item,
    );
  }
}

/// @nodoc
const $ItemImportScreenState = _$ItemImportScreenStateTearOff();

/// @nodoc
mixin _$ItemImportScreenState {
  Item? get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemImportScreenStateCopyWith<ItemImportScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemImportScreenStateCopyWith<$Res> {
  factory $ItemImportScreenStateCopyWith(ItemImportScreenState value,
          $Res Function(ItemImportScreenState) then) =
      _$ItemImportScreenStateCopyWithImpl<$Res>;
  $Res call({Item? item});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$ItemImportScreenStateCopyWithImpl<$Res>
    implements $ItemImportScreenStateCopyWith<$Res> {
  _$ItemImportScreenStateCopyWithImpl(this._value, this._then);

  final ItemImportScreenState _value;
  // ignore: unused_field
  final $Res Function(ItemImportScreenState) _then;

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
abstract class _$ItemImportScreenStateCopyWith<$Res>
    implements $ItemImportScreenStateCopyWith<$Res> {
  factory _$ItemImportScreenStateCopyWith(_ItemImportScreenState value,
          $Res Function(_ItemImportScreenState) then) =
      __$ItemImportScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({Item? item});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$ItemImportScreenStateCopyWithImpl<$Res>
    extends _$ItemImportScreenStateCopyWithImpl<$Res>
    implements _$ItemImportScreenStateCopyWith<$Res> {
  __$ItemImportScreenStateCopyWithImpl(_ItemImportScreenState _value,
      $Res Function(_ItemImportScreenState) _then)
      : super(_value, (v) => _then(v as _ItemImportScreenState));

  @override
  _ItemImportScreenState get _value => super._value as _ItemImportScreenState;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_ItemImportScreenState(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ));
  }
}

/// @nodoc

class _$_ItemImportScreenState implements _ItemImportScreenState {
  const _$_ItemImportScreenState({this.item});

  @override
  final Item? item;

  @override
  String toString() {
    return 'ItemImportScreenState(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemImportScreenState &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$ItemImportScreenStateCopyWith<_ItemImportScreenState> get copyWith =>
      __$ItemImportScreenStateCopyWithImpl<_ItemImportScreenState>(
          this, _$identity);
}

abstract class _ItemImportScreenState implements ItemImportScreenState {
  const factory _ItemImportScreenState({Item? item}) = _$_ItemImportScreenState;

  @override
  Item? get item;
  @override
  @JsonKey(ignore: true)
  _$ItemImportScreenStateCopyWith<_ItemImportScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}