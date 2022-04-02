// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announcement_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnnouncementListStateTearOff {
  const _$AnnouncementListStateTearOff();

  _AnnouncementListState call(
      {AsyncValue<List<Announcement>> data = const AsyncValue.loading(),
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) {
    return _AnnouncementListState(
      data: data,
      firstDoc: firstDoc,
      lastDoc: lastDoc,
    );
  }
}

/// @nodoc
const $AnnouncementListState = _$AnnouncementListStateTearOff();

/// @nodoc
mixin _$AnnouncementListState {
  AsyncValue<List<Announcement>> get data => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get firstDoc => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementListStateCopyWith<AnnouncementListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListStateCopyWith<$Res> {
  factory $AnnouncementListStateCopyWith(AnnouncementListState value,
          $Res Function(AnnouncementListState) then) =
      _$AnnouncementListStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class _$AnnouncementListStateCopyWithImpl<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  _$AnnouncementListStateCopyWithImpl(this._value, this._then);

  final AnnouncementListState _value;
  // ignore: unused_field
  final $Res Function(AnnouncementListState) _then;

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
              as AsyncValue<List<Announcement>>,
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
abstract class _$AnnouncementListStateCopyWith<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  factory _$AnnouncementListStateCopyWith(_AnnouncementListState value,
          $Res Function(_AnnouncementListState) then) =
      __$AnnouncementListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class __$AnnouncementListStateCopyWithImpl<$Res>
    extends _$AnnouncementListStateCopyWithImpl<$Res>
    implements _$AnnouncementListStateCopyWith<$Res> {
  __$AnnouncementListStateCopyWithImpl(_AnnouncementListState _value,
      $Res Function(_AnnouncementListState) _then)
      : super(_value, (v) => _then(v as _AnnouncementListState));

  @override
  _AnnouncementListState get _value => super._value as _AnnouncementListState;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_AnnouncementListState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Announcement>>,
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

class _$_AnnouncementListState implements _AnnouncementListState {
  const _$_AnnouncementListState(
      {this.data = const AsyncValue.loading(), this.firstDoc, this.lastDoc});

  @JsonKey()
  @override
  final AsyncValue<List<Announcement>> data;
  @override
  final DocumentSnapshot<Object?>? firstDoc;
  @override
  final DocumentSnapshot<Object?>? lastDoc;

  @override
  String toString() {
    return 'AnnouncementListState(data: $data, firstDoc: $firstDoc, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnnouncementListState &&
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
  _$AnnouncementListStateCopyWith<_AnnouncementListState> get copyWith =>
      __$AnnouncementListStateCopyWithImpl<_AnnouncementListState>(
          this, _$identity);
}

abstract class _AnnouncementListState implements AnnouncementListState {
  const factory _AnnouncementListState(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) = _$_AnnouncementListState;

  @override
  AsyncValue<List<Announcement>> get data;
  @override
  DocumentSnapshot<Object?>? get firstDoc;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  @JsonKey(ignore: true)
  _$AnnouncementListStateCopyWith<_AnnouncementListState> get copyWith =>
      throw _privateConstructorUsedError;
}
