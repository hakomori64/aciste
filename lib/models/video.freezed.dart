// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Video _$VideoFromJson(Map<String, dynamic> json) {
  return _Video.fromJson(json);
}

/// @nodoc
class _$VideoTearOff {
  const _$VideoTearOff();

  _Video call(
      {String? id,
      String name = "",
      String description = "",
      User? createdBy,
      String? url,
      @TimestampDateTimeConverter() DateTime? createdAt}) {
    return _Video(
      id: id,
      name: name,
      description: description,
      createdBy: createdBy,
      url: url,
      createdAt: createdAt,
    );
  }

  Video fromJson(Map<String, Object?> json) {
    return Video.fromJson(json);
  }
}

/// @nodoc
const $Video = _$VideoTearOff();

/// @nodoc
mixin _$Video {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  User? get createdBy => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? url,
      @TimestampDateTimeConverter() DateTime? createdAt});

  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$VideoCopyWithImpl<$Res> implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

  final Video _value;
  // ignore: unused_field
  final $Res Function(Video) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) then) =
      __$VideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? url,
      @TimestampDateTimeConverter() DateTime? createdAt});

  @override
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$VideoCopyWithImpl<$Res> extends _$VideoCopyWithImpl<$Res>
    implements _$VideoCopyWith<$Res> {
  __$VideoCopyWithImpl(_Video _value, $Res Function(_Video) _then)
      : super(_value, (v) => _then(v as _Video));

  @override
  _Video get _value => super._value as _Video;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Video(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Video extends _Video {
  const _$_Video(
      {this.id,
      this.name = "",
      this.description = "",
      this.createdBy,
      this.url,
      @TimestampDateTimeConverter() this.createdAt})
      : super._();

  factory _$_Video.fromJson(Map<String, dynamic> json) =>
      _$$_VideoFromJson(json);

  @override
  final String? id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String description;
  @override
  final User? createdBy;
  @override
  final String? url;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Video(id: $id, name: $name, description: $description, createdBy: $createdBy, url: $url, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Video &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$VideoCopyWith<_Video> get copyWith =>
      __$VideoCopyWithImpl<_Video>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoToJson(this);
  }
}

abstract class _Video extends Video {
  const factory _Video(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? url,
      @TimestampDateTimeConverter() DateTime? createdAt}) = _$_Video;
  const _Video._() : super._();

  factory _Video.fromJson(Map<String, dynamic> json) = _$_Video.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  User? get createdBy;
  @override
  String? get url;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$VideoCopyWith<_Video> get copyWith => throw _privateConstructorUsedError;
}
