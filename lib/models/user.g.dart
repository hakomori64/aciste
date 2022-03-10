// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      bio: json['bio'] as String,
      photoUrl: json['photoUrl'] as String,
      backgroundImageUrl: json['backgroundImageUrl'] as String,
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followedBy: (json['followedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'following': instance.following,
      'followedBy': instance.followedBy,
    };
