// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_item_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileItemListStateTearOff {
  const _$ProfileItemListStateTearOff();

  _ProfileItemListState call(
      {AsyncValue<List<Item>> data = const AsyncValue.loading(),
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) {
    return _ProfileItemListState(
      data: data,
      firstDoc: firstDoc,
      lastDoc: lastDoc,
    );
  }
}

/// @nodoc
const $ProfileItemListState = _$ProfileItemListStateTearOff();

/// @nodoc
mixin _$ProfileItemListState {
  AsyncValue<List<Item>> get data => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get firstDoc => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileItemListStateCopyWith<ProfileItemListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileItemListStateCopyWith<$Res> {
  factory $ProfileItemListStateCopyWith(ProfileItemListState value,
          $Res Function(ProfileItemListState) then) =
      _$ProfileItemListStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class _$ProfileItemListStateCopyWithImpl<$Res>
    implements $ProfileItemListStateCopyWith<$Res> {
  _$ProfileItemListStateCopyWithImpl(this._value, this._then);

  final ProfileItemListState _value;
  // ignore: unused_field
  final $Res Function(ProfileItemListState) _then;

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
              as DocumentSnapshot<Object?>?,
      lastDoc: lastDoc == freezed
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc
abstract class _$ProfileItemListStateCopyWith<$Res>
    implements $ProfileItemListStateCopyWith<$Res> {
  factory _$ProfileItemListStateCopyWith(_ProfileItemListState value,
          $Res Function(_ProfileItemListState) then) =
      __$ProfileItemListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class __$ProfileItemListStateCopyWithImpl<$Res>
    extends _$ProfileItemListStateCopyWithImpl<$Res>
    implements _$ProfileItemListStateCopyWith<$Res> {
  __$ProfileItemListStateCopyWithImpl(
      _ProfileItemListState _value, $Res Function(_ProfileItemListState) _then)
      : super(_value, (v) => _then(v as _ProfileItemListState));

  @override
  _ProfileItemListState get _value => super._value as _ProfileItemListState;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_ProfileItemListState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Item>>,
      firstDoc: firstDoc == freezed
          ? _value.firstDoc
          : firstDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      lastDoc: lastDoc == freezed
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc

class _$_ProfileItemListState implements _ProfileItemListState {
  const _$_ProfileItemListState(
      {this.data = const AsyncValue.loading(), this.firstDoc, this.lastDoc});

  @JsonKey()
  @override
  final AsyncValue<List<Item>> data;
  @override
  final DocumentSnapshot<Object?>? firstDoc;
  @override
  final DocumentSnapshot<Object?>? lastDoc;

  @override
  String toString() {
    return 'ProfileItemListState(data: $data, firstDoc: $firstDoc, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileItemListState &&
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
  _$ProfileItemListStateCopyWith<_ProfileItemListState> get copyWith =>
      __$ProfileItemListStateCopyWithImpl<_ProfileItemListState>(
          this, _$identity);
}

abstract class _ProfileItemListState implements ProfileItemListState {
  const factory _ProfileItemListState(
      {AsyncValue<List<Item>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) = _$_ProfileItemListState;

  @override
  AsyncValue<List<Item>> get data;
  @override
  DocumentSnapshot<Object?>? get firstDoc;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  @JsonKey(ignore: true)
  _$ProfileItemListStateCopyWith<_ProfileItemListState> get copyWith =>
      throw _privateConstructorUsedError;
}
