// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Announcement _$$_AnnouncementFromJson(Map<String, dynamic> json) =>
    _$_Announcement(
      id: json['id'] as String?,
      message: json['message'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      announceType:
          $enumDecodeNullable(_$AnnounceTypeEnumMap, json['announceType']),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_AnnouncementToJson(_$_Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'user': instance.user,
      'announceType': _$AnnounceTypeEnumMap[instance.announceType],
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
    };

const _$AnnounceTypeEnumMap = {
  AnnounceType.itemCreate: 'itemCreate',
};
