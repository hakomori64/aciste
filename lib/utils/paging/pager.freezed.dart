// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PagerTearOff {
  const _$PagerTearOff();

  _Pager<T> call<T extends PagingItem>(
      {AsyncValue<List<T>> data = const AsyncValue.loading(),
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) {
    return _Pager<T>(
      data: data,
      firstDoc: firstDoc,
      lastDoc: lastDoc,
    );
  }
}

/// @nodoc
const $Pager = _$PagerTearOff();

/// @nodoc
mixin _$Pager<T extends PagingItem> {
  AsyncValue<List<T>> get data => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get firstDoc => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagerCopyWith<T, Pager<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagerCopyWith<T extends PagingItem, $Res> {
  factory $PagerCopyWith(Pager<T> value, $Res Function(Pager<T>) then) =
      _$PagerCopyWithImpl<T, $Res>;
  $Res call(
      {AsyncValue<List<T>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class _$PagerCopyWithImpl<T extends PagingItem, $Res>
    implements $PagerCopyWith<T, $Res> {
  _$PagerCopyWithImpl(this._value, this._then);

  final Pager<T> _value;
  // ignore: unused_field
  final $Res Function(Pager<T>) _then;

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
              as AsyncValue<List<T>>,
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
abstract class _$PagerCopyWith<T extends PagingItem, $Res>
    implements $PagerCopyWith<T, $Res> {
  factory _$PagerCopyWith(_Pager<T> value, $Res Function(_Pager<T>) then) =
      __$PagerCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {AsyncValue<List<T>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class __$PagerCopyWithImpl<T extends PagingItem, $Res>
    extends _$PagerCopyWithImpl<T, $Res> implements _$PagerCopyWith<T, $Res> {
  __$PagerCopyWithImpl(_Pager<T> _value, $Res Function(_Pager<T>) _then)
      : super(_value, (v) => _then(v as _Pager<T>));

  @override
  _Pager<T> get _value => super._value as _Pager<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_Pager<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<T>>,
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

class _$_Pager<T extends PagingItem> implements _Pager<T> {
  const _$_Pager(
      {this.data = const AsyncValue.loading(), this.firstDoc, this.lastDoc});

  @JsonKey()
  @override
  final AsyncValue<List<T>> data;
  @override
  final DocumentSnapshot<Object?>? firstDoc;
  @override
  final DocumentSnapshot<Object?>? lastDoc;

  @override
  String toString() {
    return 'Pager<$T>(data: $data, firstDoc: $firstDoc, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pager<T> &&
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
  _$PagerCopyWith<T, _Pager<T>> get copyWith =>
      __$PagerCopyWithImpl<T, _Pager<T>>(this, _$identity);
}

abstract class _Pager<T extends PagingItem> implements Pager<T> {
  const factory _Pager(
      {AsyncValue<List<T>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) = _$_Pager<T>;

  @override
  AsyncValue<List<T>> get data;
  @override
  DocumentSnapshot<Object?>? get firstDoc;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  @JsonKey(ignore: true)
  _$PagerCopyWith<T, _Pager<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
