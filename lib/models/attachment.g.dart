// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attachment _$$_AttachmentFromJson(Map<String, dynamic> json) =>
    _$_Attachment(
      id: json['id'] as String?,
      type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
      data: json['data'] == null
          ? null
          : AttachmentData.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_AttachmentToJson(_$_Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AttachmentTypeEnumMap[instance.type],
      'data': instance.data,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.photo: 'photo',
  AttachmentType.none: 'none',
};
