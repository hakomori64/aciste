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
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
    };
