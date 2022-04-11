// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cmap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CMap _$CMapFromJson(Map<String, dynamic> json) {
  return _CMap.fromJson(json);
}

/// @nodoc
class _$CMapTearOff {
  const _$CMapTearOff();

  _CMap call(
      {String? id,
      required String message,
      required String password,
      required String link,
      dynamic type = CMapType.password,
      Cache? cache,
      User? user,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<Attachment> attachments = const [],
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) {
    return _CMap(
      id: id,
      message: message,
      password: password,
      link: link,
      type: type,
      cache: cache,
      user: user,
      createdAt: createdAt,
      updatedAt: updatedAt,
      attachments: attachments,
      doc: doc,
    );
  }

  CMap fromJson(Map<String, Object?> json) {
    return CMap.fromJson(json);
  }
}

/// @nodoc
const $CMap = _$CMapTearOff();

/// @nodoc
mixin _$CMap {
  String? get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  Cache? get cache => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<Attachment> get attachments => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CMapCopyWith<CMap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CMapCopyWith<$Res> {
  factory $CMapCopyWith(CMap value, $Res Function(CMap) then) =
      _$CMapCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String message,
      String password,
      String link,
      dynamic type,
      Cache? cache,
      User? user,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<Attachment> attachments,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  $CacheCopyWith<$Res>? get cache;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CMapCopyWithImpl<$Res> implements $CMapCopyWith<$Res> {
  _$CMapCopyWithImpl(this._value, this._then);

  final CMap _value;
  // ignore: unused_field
  final $Res Function(CMap) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? password = freezed,
    Object? link = freezed,
    Object? type = freezed,
    Object? cache = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? attachments = freezed,
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
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }

  @override
  $CacheCopyWith<$Res>? get cache {
    if (_value.cache == null) {
      return null;
    }

    return $CacheCopyWith<$Res>(_value.cache!, (value) {
      return _then(_value.copyWith(cache: value));
    });
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
abstract class _$CMapCopyWith<$Res> implements $CMapCopyWith<$Res> {
  factory _$CMapCopyWith(_CMap value, $Res Function(_CMap) then) =
      __$CMapCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String message,
      String password,
      String link,
      dynamic type,
      Cache? cache,
      User? user,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<Attachment> attachments,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  @override
  $CacheCopyWith<$Res>? get cache;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$CMapCopyWithImpl<$Res> extends _$CMapCopyWithImpl<$Res>
    implements _$CMapCopyWith<$Res> {
  __$CMapCopyWithImpl(_CMap _value, $Res Function(_CMap) _then)
      : super(_value, (v) => _then(v as _CMap));

  @override
  _CMap get _value => super._value as _CMap;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? password = freezed,
    Object? link = freezed,
    Object? type = freezed,
    Object? cache = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? attachments = freezed,
    Object? doc = freezed,
  }) {
    return _then(_CMap(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed ? _value.type : type,
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CMap extends _CMap {
  const _$_CMap(
      {this.id,
      required this.message,
      required this.password,
      required this.link,
      this.type = CMapType.password,
      this.cache,
      this.user,
      @TimestampDateTimeConverter() this.createdAt,
      @TimestampDateTimeConverter() this.updatedAt,
      this.attachments = const [],
      @JsonKey(ignore: true) this.doc})
      : super._();

  factory _$_CMap.fromJson(Map<String, dynamic> json) => _$$_CMapFromJson(json);

  @override
  final String? id;
  @override
  final String message;
  @override
  final String password;
  @override
  final String link;
  @JsonKey()
  @override
  final dynamic type;
  @override
  final Cache? cache;
  @override
  final User? user;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @TimestampDateTimeConverter()
  final DateTime? updatedAt;
  @JsonKey()
  @override
  final List<Attachment> attachments;
  @override
  @JsonKey(ignore: true)
  final DocumentSnapshot<Object?>? doc;

  @override
  String toString() {
    return 'CMap(id: $id, message: $message, password: $password, link: $link, type: $type, cache: $cache, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, attachments: $attachments, doc: $doc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CMap &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.cache, cache) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality().equals(other.doc, doc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(cache),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(doc));

  @JsonKey(ignore: true)
  @override
  _$CMapCopyWith<_CMap> get copyWith =>
      __$CMapCopyWithImpl<_CMap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CMapToJson(this);
  }
}

abstract class _CMap extends CMap {
  const factory _CMap(
      {String? id,
      required String message,
      required String password,
      required String link,
      dynamic type,
      Cache? cache,
      User? user,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<Attachment> attachments,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) = _$_CMap;
  const _CMap._() : super._();

  factory _CMap.fromJson(Map<String, dynamic> json) = _$_CMap.fromJson;

  @override
  String? get id;
  @override
  String get message;
  @override
  String get password;
  @override
  String get link;
  @override
  dynamic get type;
  @override
  Cache? get cache;
  @override
  User? get user;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @TimestampDateTimeConverter()
  DateTime? get updatedAt;
  @override
  List<Attachment> get attachments;
  @override
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc;
  @override
  @JsonKey(ignore: true)
  _$CMapCopyWith<_CMap> get copyWith => throw _privateConstructorUsedError;
}
