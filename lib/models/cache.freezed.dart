// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cache _$CacheFromJson(Map<String, dynamic> json) {
  return _Cache.fromJson(json);
}

/// @nodoc
class _$CacheTearOff {
  const _$CacheTearOff();

  _Cache call(
      {String? id,
      required String description,
      Resource? resource,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      int rank = 0,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) {
    return _Cache(
      id: id,
      description: description,
      resource: resource,
      createdAt: createdAt,
      updatedAt: updatedAt,
      rank: rank,
      doc: doc,
    );
  }

  Cache fromJson(Map<String, Object?> json) {
    return Cache.fromJson(json);
  }
}

/// @nodoc
const $Cache = _$CacheTearOff();

/// @nodoc
mixin _$Cache {
  String? get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Resource? get resource => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CacheCopyWith<Cache> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheCopyWith<$Res> {
  factory $CacheCopyWith(Cache value, $Res Function(Cache) then) =
      _$CacheCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String description,
      Resource? resource,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      int rank,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  $ResourceCopyWith<$Res>? get resource;
}

/// @nodoc
class _$CacheCopyWithImpl<$Res> implements $CacheCopyWith<$Res> {
  _$CacheCopyWithImpl(this._value, this._then);

  final Cache _value;
  // ignore: unused_field
  final $Res Function(Cache) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? resource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rank = freezed,
    Object? doc = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }

  @override
  $ResourceCopyWith<$Res>? get resource {
    if (_value.resource == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.resource!, (value) {
      return _then(_value.copyWith(resource: value));
    });
  }
}

/// @nodoc
abstract class _$CacheCopyWith<$Res> implements $CacheCopyWith<$Res> {
  factory _$CacheCopyWith(_Cache value, $Res Function(_Cache) then) =
      __$CacheCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String description,
      Resource? resource,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      int rank,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc});

  @override
  $ResourceCopyWith<$Res>? get resource;
}

/// @nodoc
class __$CacheCopyWithImpl<$Res> extends _$CacheCopyWithImpl<$Res>
    implements _$CacheCopyWith<$Res> {
  __$CacheCopyWithImpl(_Cache _value, $Res Function(_Cache) _then)
      : super(_value, (v) => _then(v as _Cache));

  @override
  _Cache get _value => super._value as _Cache;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? resource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rank = freezed,
    Object? doc = freezed,
  }) {
    return _then(_Cache(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      doc: doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cache extends _Cache {
  const _$_Cache(
      {this.id,
      required this.description,
      this.resource,
      @TimestampDateTimeConverter() this.createdAt,
      @TimestampDateTimeConverter() this.updatedAt,
      this.rank = 0,
      @JsonKey(ignore: true) this.doc})
      : super._();

  factory _$_Cache.fromJson(Map<String, dynamic> json) =>
      _$$_CacheFromJson(json);

  @override
  final String? id;
  @override
  final String description;
  @override
  final Resource? resource;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @TimestampDateTimeConverter()
  final DateTime? updatedAt;
  @JsonKey()
  @override
  final int rank;
  @override
  @JsonKey(ignore: true)
  final DocumentSnapshot<Object?>? doc;

  @override
  String toString() {
    return 'Cache(id: $id, description: $description, resource: $resource, createdAt: $createdAt, updatedAt: $updatedAt, rank: $rank, doc: $doc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cache &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.resource, resource) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.rank, rank) &&
            const DeepCollectionEquality().equals(other.doc, doc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(resource),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(rank),
      const DeepCollectionEquality().hash(doc));

  @JsonKey(ignore: true)
  @override
  _$CacheCopyWith<_Cache> get copyWith =>
      __$CacheCopyWithImpl<_Cache>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CacheToJson(this);
  }
}

abstract class _Cache extends Cache {
  const factory _Cache(
      {String? id,
      required String description,
      Resource? resource,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      int rank,
      @JsonKey(ignore: true) DocumentSnapshot<Object?>? doc}) = _$_Cache;
  const _Cache._() : super._();

  factory _Cache.fromJson(Map<String, dynamic> json) = _$_Cache.fromJson;

  @override
  String? get id;
  @override
  String get description;
  @override
  Resource? get resource;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @TimestampDateTimeConverter()
  DateTime? get updatedAt;
  @override
  int get rank;
  @override
  @JsonKey(ignore: true)
  DocumentSnapshot<Object?>? get doc;
  @override
  @JsonKey(ignore: true)
  _$CacheCopyWith<_Cache> get copyWith => throw _privateConstructorUsedError;
}
