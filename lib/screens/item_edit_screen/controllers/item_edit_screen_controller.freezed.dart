// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_edit_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemEditScreenStateTearOff {
  const _$ItemEditScreenStateTearOff();

  _ItemEditScreenState call(
      {Item? item,
      bool isNameEditing = false,
      bool isDescriptionEditing = false,
      String description = ""}) {
    return _ItemEditScreenState(
      item: item,
      isNameEditing: isNameEditing,
      isDescriptionEditing: isDescriptionEditing,
      description: description,
    );
  }
}

/// @nodoc
const $ItemEditScreenState = _$ItemEditScreenStateTearOff();

/// @nodoc
mixin _$ItemEditScreenState {
  Item? get item => throw _privateConstructorUsedError;
  bool get isNameEditing => throw _privateConstructorUsedError;
  bool get isDescriptionEditing => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemEditScreenStateCopyWith<ItemEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEditScreenStateCopyWith<$Res> {
  factory $ItemEditScreenStateCopyWith(
          ItemEditScreenState value, $Res Function(ItemEditScreenState) then) =
      _$ItemEditScreenStateCopyWithImpl<$Res>;
  $Res call(
      {Item? item,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$ItemEditScreenStateCopyWithImpl<$Res>
    implements $ItemEditScreenStateCopyWith<$Res> {
  _$ItemEditScreenStateCopyWithImpl(this._value, this._then);

  final ItemEditScreenState _value;
  // ignore: unused_field
  final $Res Function(ItemEditScreenState) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? isNameEditing = freezed,
    Object? isDescriptionEditing = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      isNameEditing: isNameEditing == freezed
          ? _value.isNameEditing
          : isNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionEditing: isDescriptionEditing == freezed
          ? _value.isDescriptionEditing
          : isDescriptionEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$ItemEditScreenStateCopyWith<$Res>
    implements $ItemEditScreenStateCopyWith<$Res> {
  factory _$ItemEditScreenStateCopyWith(_ItemEditScreenState value,
          $Res Function(_ItemEditScreenState) then) =
      __$ItemEditScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Item? item,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$ItemEditScreenStateCopyWithImpl<$Res>
    extends _$ItemEditScreenStateCopyWithImpl<$Res>
    implements _$ItemEditScreenStateCopyWith<$Res> {
  __$ItemEditScreenStateCopyWithImpl(
      _ItemEditScreenState _value, $Res Function(_ItemEditScreenState) _then)
      : super(_value, (v) => _then(v as _ItemEditScreenState));

  @override
  _ItemEditScreenState get _value => super._value as _ItemEditScreenState;

  @override
  $Res call({
    Object? item = freezed,
    Object? isNameEditing = freezed,
    Object? isDescriptionEditing = freezed,
    Object? description = freezed,
  }) {
    return _then(_ItemEditScreenState(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      isNameEditing: isNameEditing == freezed
          ? _value.isNameEditing
          : isNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionEditing: isDescriptionEditing == freezed
          ? _value.isDescriptionEditing
          : isDescriptionEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ItemEditScreenState implements _ItemEditScreenState {
  const _$_ItemEditScreenState(
      {this.item,
      this.isNameEditing = false,
      this.isDescriptionEditing = false,
      this.description = ""});

  @override
  final Item? item;
  @JsonKey()
  @override
  final bool isNameEditing;
  @JsonKey()
  @override
  final bool isDescriptionEditing;
  @JsonKey()
  @override
  final String description;

  @override
  String toString() {
    return 'ItemEditScreenState(item: $item, isNameEditing: $isNameEditing, isDescriptionEditing: $isDescriptionEditing, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemEditScreenState &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.isNameEditing, isNameEditing) &&
            const DeepCollectionEquality()
                .equals(other.isDescriptionEditing, isDescriptionEditing) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(isNameEditing),
      const DeepCollectionEquality().hash(isDescriptionEditing),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$ItemEditScreenStateCopyWith<_ItemEditScreenState> get copyWith =>
      __$ItemEditScreenStateCopyWithImpl<_ItemEditScreenState>(
          this, _$identity);
}

abstract class _ItemEditScreenState implements ItemEditScreenState {
  const factory _ItemEditScreenState(
      {Item? item,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description}) = _$_ItemEditScreenState;

  @override
  Item? get item;
  @override
  bool get isNameEditing;
  @override
  bool get isDescriptionEditing;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$ItemEditScreenStateCopyWith<_ItemEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
