// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_announce_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileAnnounceListStateTearOff {
  const _$ProfileAnnounceListStateTearOff();

  _ProfileAnnounceListState call(
      {AsyncValue<List<Announcement>> data = const AsyncValue.loading(),
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) {
    return _ProfileAnnounceListState(
      data: data,
      firstDoc: firstDoc,
      lastDoc: lastDoc,
    );
  }
}

/// @nodoc
const $ProfileAnnounceListState = _$ProfileAnnounceListStateTearOff();

/// @nodoc
mixin _$ProfileAnnounceListState {
  AsyncValue<List<Announcement>> get data => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get firstDoc => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileAnnounceListStateCopyWith<ProfileAnnounceListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAnnounceListStateCopyWith<$Res> {
  factory $ProfileAnnounceListStateCopyWith(ProfileAnnounceListState value,
          $Res Function(ProfileAnnounceListState) then) =
      _$ProfileAnnounceListStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class _$ProfileAnnounceListStateCopyWithImpl<$Res>
    implements $ProfileAnnounceListStateCopyWith<$Res> {
  _$ProfileAnnounceListStateCopyWithImpl(this._value, this._then);

  final ProfileAnnounceListState _value;
  // ignore: unused_field
  final $Res Function(ProfileAnnounceListState) _then;

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
abstract class _$ProfileAnnounceListStateCopyWith<$Res>
    implements $ProfileAnnounceListStateCopyWith<$Res> {
  factory _$ProfileAnnounceListStateCopyWith(_ProfileAnnounceListState value,
          $Res Function(_ProfileAnnounceListState) then) =
      __$ProfileAnnounceListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc});
}

/// @nodoc
class __$ProfileAnnounceListStateCopyWithImpl<$Res>
    extends _$ProfileAnnounceListStateCopyWithImpl<$Res>
    implements _$ProfileAnnounceListStateCopyWith<$Res> {
  __$ProfileAnnounceListStateCopyWithImpl(_ProfileAnnounceListState _value,
      $Res Function(_ProfileAnnounceListState) _then)
      : super(_value, (v) => _then(v as _ProfileAnnounceListState));

  @override
  _ProfileAnnounceListState get _value =>
      super._value as _ProfileAnnounceListState;

  @override
  $Res call({
    Object? data = freezed,
    Object? firstDoc = freezed,
    Object? lastDoc = freezed,
  }) {
    return _then(_ProfileAnnounceListState(
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

class _$_ProfileAnnounceListState implements _ProfileAnnounceListState {
  const _$_ProfileAnnounceListState(
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
    return 'ProfileAnnounceListState(data: $data, firstDoc: $firstDoc, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileAnnounceListState &&
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
  _$ProfileAnnounceListStateCopyWith<_ProfileAnnounceListState> get copyWith =>
      __$ProfileAnnounceListStateCopyWithImpl<_ProfileAnnounceListState>(
          this, _$identity);
}

abstract class _ProfileAnnounceListState implements ProfileAnnounceListState {
  const factory _ProfileAnnounceListState(
      {AsyncValue<List<Announcement>> data,
      DocumentSnapshot<Object?>? firstDoc,
      DocumentSnapshot<Object?>? lastDoc}) = _$_ProfileAnnounceListState;

  @override
  AsyncValue<List<Announcement>> get data;
  @override
  DocumentSnapshot<Object?>? get firstDoc;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  @JsonKey(ignore: true)
  _$ProfileAnnounceListStateCopyWith<_ProfileAnnounceListState> get copyWith =>
      throw _privateConstructorUsedError;
}
