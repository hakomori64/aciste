// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String? id,
      required String email,
      required String displayName,
      required String bio,
      required String photoUrl,
      required String backgroundImageUrl,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<String> following = const [],
      List<String> followedBy = const []}) {
    return _User(
      id: id,
      email: email,
      displayName: displayName,
      bio: bio,
      photoUrl: photoUrl,
      backgroundImageUrl: backgroundImageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      following: following,
      followedBy: followedBy,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get backgroundImageUrl => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get following => throw _privateConstructorUsedError;
  List<String> get followedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String email,
      String displayName,
      String bio,
      String photoUrl,
      String backgroundImageUrl,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<String> following,
      List<String> followedBy});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? bio = freezed,
    Object? photoUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? following = freezed,
    Object? followedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedBy: followedBy == freezed
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String email,
      String displayName,
      String bio,
      String photoUrl,
      String backgroundImageUrl,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<String> following,
      List<String> followedBy});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? bio = freezed,
    Object? photoUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? following = freezed,
    Object? followedBy = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedBy: followedBy == freezed
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {this.id,
      required this.email,
      required this.displayName,
      required this.bio,
      required this.photoUrl,
      required this.backgroundImageUrl,
      @TimestampDateTimeConverter() this.createdAt,
      @TimestampDateTimeConverter() this.updatedAt,
      this.following = const [],
      this.followedBy = const []})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String bio;
  @override
  final String photoUrl;
  @override
  final String backgroundImageUrl;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @TimestampDateTimeConverter()
  final DateTime? updatedAt;
  @JsonKey()
  @override
  final List<String> following;
  @JsonKey()
  @override
  final List<String> followedBy;

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, bio: $bio, photoUrl: $photoUrl, backgroundImageUrl: $backgroundImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, following: $following, followedBy: $followedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.backgroundImageUrl, backgroundImageUrl) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality()
                .equals(other.followedBy, followedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(bio),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(backgroundImageUrl),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followedBy));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User(
      {String? id,
      required String email,
      required String displayName,
      required String bio,
      required String photoUrl,
      required String backgroundImageUrl,
      @TimestampDateTimeConverter() DateTime? createdAt,
      @TimestampDateTimeConverter() DateTime? updatedAt,
      List<String> following,
      List<String> followedBy}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String get bio;
  @override
  String get photoUrl;
  @override
  String get backgroundImageUrl;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @TimestampDateTimeConverter()
  DateTime? get updatedAt;
  @override
  List<String> get following;
  @override
  List<String> get followedBy;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
