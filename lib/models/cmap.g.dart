// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CMap _$$_CMapFromJson(Map<String, dynamic> json) => _$_CMap(
      id: json['id'] as String?,
      message: json['message'] as String,
      password: json['password'] as String,
      link: json['link'] as String,
      type: json['type'] ?? CMapType.password,
      cache: json['cache'] == null
          ? null
          : Cache.fromJson(json['cache'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CMapToJson(_$_CMap instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'password': instance.password,
      'link': instance.link,
      'type': instance.type,
      'cache': instance.cache,
      'user': instance.user,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'attachments': instance.attachments,
    };
