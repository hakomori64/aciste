// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Resource _$$_ResourceFromJson(Map<String, dynamic> json) => _$_Resource(
      id: json['id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      viewCount: json['viewCount'] as int? ?? 0,
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResourceToJson(_$_Resource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'viewCount': instance.viewCount,
      'createdBy': instance.createdBy,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'attachments': instance.attachments,
    };
