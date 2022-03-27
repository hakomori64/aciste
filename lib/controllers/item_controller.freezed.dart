// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemListStateTearOff {
  const _$ItemListStateTearOff();

  _ItemListState call(
      {AsyncValue<List<Item>> data = const AsyncValue.loading(),
      DocumentSnapshot? firstDoc,
      DocumentSnapshot? lastDoc}) {
    return _ItemListState(
      data: data,
      firstDoc: firstDoc,
      lastDoc: lastDoc,
    );
  }
}

/// @nodoc
const $ItemListState = _$ItemListStateTearOff();

/// @nodoc
mixin _$ItemListState {
  AsyncValue<List<Item>> get data => throw _privateConstructorUsedError;
  DocumentSnapshot? get firstDoc => throw _privateConstructorUsedError;
  DocumentSnapshot? get lastDoc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemListStateCopyWith<ItemListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListStateCopyWith<$Res> {
  factory $ItemListStateCopyWith(
          ItemListState value, $Res Function(ItemListState) then) =
      _$ItemListStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot? firstDoc,
      DocumentSnapshot? lastDoc});
}

/// @nodoc
class _$ItemListStateCopyWithImpl<$Res>
    implements $ItemListStateCopyWith<$Res> {
  _$ItemListStateCopyWithImpl(this._value, this._then);

  final ItemListState _value;
  // ignore: unused_field
  final $Res Function(ItemListState) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Item>>,
      firstDoc: firstDoc == freezed
          ? _value.firstDoc
          : firstDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
      lastDoc: lastDoc == freezed
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
    ));
  }
}

/// @nodoc
abstract class _$ItemListStateCopyWith<$Res>
    implements $ItemListStateCopyWith<$Res> {
  factory _$ItemListStateCopyWith(
          _ItemListState value, $Res Function(_ItemListState) then) =
      __$ItemListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot? firstDoc,
      DocumentSnapshot? lastDoc});
}

/// @nodoc
class __$ItemListStateCopyWithImpl<$Res>
    extends _$ItemListStateCopyWithImpl<$Res>
    implements _$ItemListStateCopyWith<$Res> {
  __$ItemListStateCopyWithImpl(
      _ItemListState _value, $Res Function(_ItemListState) _then)
      : super(_value, (v) => _then(v as _ItemListState));

  @override
  _ItemListState get _value => super._value as _ItemListState;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_ItemListState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Item>>,
      firstDoc: firstDoc == freezed
          ? _value.firstDoc
          : firstDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
      lastDoc: lastDoc == freezed
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
    ));
  }
}

/// @nodoc

class _$_ItemListState implements _ItemListState {
  const _$_ItemListState(
      {this.data = const AsyncValue.loading(), this.firstDoc, this.lastDoc});

  @JsonKey()
  @override
  final AsyncValue<List<Item>> data;
  @override
  final DocumentSnapshot? firstDoc;
  @override
  final DocumentSnapshot? lastDoc;

  @override
  String toString() {
    return 'ItemListState(data: $data, firstDoc: $firstDoc, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemListState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.firstDoc, firstDoc) &&
            const DeepCollectionEquality().equals(other.lastDoc, lastDoc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(firstDoc),
      const DeepCollectionEquality().hash(lastDoc));

  @JsonKey(ignore: true)
  @override
  _$ItemListStateCopyWith<_ItemListState> get copyWith =>
      __$ItemListStateCopyWithImpl<_ItemListState>(this, _$identity);
}

abstract class _ItemListState implements ItemListState {
  const factory _ItemListState(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot? firstDoc,
      DocumentSnapshot? lastDoc}) = _$_ItemListState;

  @override
  AsyncValue<List<Item>> get data;
  @override
  DocumentSnapshot? get firstDoc;
  @override
  DocumentSnapshot? get lastDoc;
  @override
  @JsonKey(ignore: true)
  _$ItemListStateCopyWith<_ItemListState> get copyWith =>
      throw _privateConstructorUsedError;
}
