// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return _Resource.fromJson(json);
}

/// @nodoc
class _$ResourceTearOff {
  const _$ResourceTearOff();

  _Resource call(
      {String? id,
      User? createdBy,
      required String url,
      required ResourceType type,
      @TimestampDateTimeConverter() DateTime? createdAt}) {
    return _Resource(
      id: id,
      createdBy: createdBy,
      url: url,
      type: type,
      createdAt: createdAt,
    );
  }

  Resource fromJson(Map<String, Object?> json) {
    return Resource.fromJson(json);
  }
}

/// @nodoc
const $Resource = _$ResourceTearOff();

/// @nodoc
mixin _$Resource {
  String? get id => throw _privateConstructorUsedError;
  User? get createdBy => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  ResourceType get type => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      User? createdBy,
      String url,
      ResourceType type,
      @TimestampDateTimeConverter() DateTime? createdAt});

  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res> implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  final Resource _value;
  // ignore: unused_field
  final $Res Function(Resource) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value));
    });
  }
}

/// @nodoc
abstract class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) then) =
      __$ResourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      User? createdBy,
      String url,
      ResourceType type,
      @TimestampDateTimeConverter() DateTime? createdAt});

  @override
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$ResourceCopyWithImpl<$Res> extends _$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(_Resource _value, $Res Function(_Resource) _then)
      : super(_value, (v) => _then(v as _Resource));

  @override
  _Resource get _value => super._value as _Resource;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Resource(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Resource extends _Resource {
  const _$_Resource(
      {this.id,
      this.createdBy,
      required this.url,
      required this.type,
      @TimestampDateTimeConverter() this.createdAt})
      : super._();

  factory _$_Resource.fromJson(Map<String, dynamic> json) =>
      _$$_ResourceFromJson(json);

  @override
  final String? id;
  @override
  final User? createdBy;
  @override
  final String url;
  @override
  final ResourceType type;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Resource(id: $id, createdBy: $createdBy, url: $url, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Resource &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ResourceCopyWith<_Resource> get copyWith =>
      __$ResourceCopyWithImpl<_Resource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResourceToJson(this);
  }
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {String? id,
      User? createdBy,
      required String url,
      required ResourceType type,
      @TimestampDateTimeConverter() DateTime? createdAt}) = _$_Resource;
  const _Resource._() : super._();

  factory _Resource.fromJson(Map<String, dynamic> json) = _$_Resource.fromJson;

  @override
  String? get id;
  @override
  User? get createdBy;
  @override
  String get url;
  @override
  ResourceType get type;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ResourceCopyWith<_Resource> get copyWith =>
      throw _privateConstructorUsedError;
}
