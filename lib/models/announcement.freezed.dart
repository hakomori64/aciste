// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

/// @nodoc
class _$AnnouncementTearOff {
  const _$AnnouncementTearOff();

  _Announcement call(
      {String? id,
      required String message,
      User? user,
      AnnounceType? announceType,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) {
    return _Announcement(
      id: id,
      message: message,
      user: user,
      announceType: announceType,
      createdAt: createdAt,
      doc: doc,
    );
  }

  Announcement fromJson(Map<String, Object?> json) {
    return Announcement.fromJson(json);
  }
}

/// @nodoc
const $Announcement = _$AnnouncementTearOff();

/// @nodoc
mixin _$Announcement {
  String? get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  AnnounceType? get announceType => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementCopyWith<Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String message,
      User? user,
      AnnounceType? announceType,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AnnouncementCopyWithImpl<$Res> implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  final Announcement _value;
  // ignore: unused_field
  final $Res Function(Announcement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? user = freezed,
    Object? announceType = freezed,
    Object? createdAt = freezed,
    Object? doc = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      announceType: announceType == freezed
          ? _value.announceType
          : announceType // ignore: cast_nullable_to_non_nullable
              as AnnounceType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AnnouncementCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$AnnouncementCopyWith(
          _Announcement value, $Res Function(_Announcement) then) =
      __$AnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String message,
      User? user,
      AnnounceType? announceType,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$AnnouncementCopyWithImpl<$Res> extends _$AnnouncementCopyWithImpl<$Res>
    implements _$AnnouncementCopyWith<$Res> {
  __$AnnouncementCopyWithImpl(
      _Announcement _value, $Res Function(_Announcement) _then)
      : super(_value, (v) => _then(v as _Announcement));

  @override
  _Announcement get _value => super._value as _Announcement;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? user = freezed,
    Object? announceType = freezed,
    Object? createdAt = freezed,
    Object? doc = freezed,
  }) {
    return _then(_Announcement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      announceType: announceType == freezed
          ? _value.announceType
          : announceType // ignore: cast_nullable_to_non_nullable
              as AnnounceType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Announcement extends _Announcement {
  const _$_Announcement(
      {this.id,
      required this.message,
      this.user,
      this.announceType,
      @TimestampDateTimeConverter() this.createdAt,
      @JsonKey(ignore: true) this.doc})
      : super._();

  factory _$_Announcement.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementFromJson(json);

  @override
  final String? id;
  @override
  final String message;
  @override
  final User? user;
  @override
  final AnnounceType? announceType;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(ignore: true)
  final DocumentSnapshot<Object?>? doc;

  @override
  String toString() {
    return 'Announcement(id: $id, message: $message, user: $user, announceType: $announceType, createdAt: $createdAt, doc: $doc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Announcement &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.announceType, announceType) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.doc, doc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(announceType),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(doc));

  @JsonKey(ignore: true)
  @override
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      __$AnnouncementCopyWithImpl<_Announcement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementToJson(this);
  }
}

abstract class _Announcement extends Announcement {
  const factory _Announcement(
      {String? id,
      required String message,
      User? user,
      AnnounceType? announceType,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) = _$_Announcement;
  const _Announcement._() : super._();

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$_Announcement.fromJson;

  @override
  String? get id;
  @override
  String get message;
  @override
  User? get user;
  @override
  AnnounceType? get announceType;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc;
  @override
  @JsonKey(ignore: true)
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}
