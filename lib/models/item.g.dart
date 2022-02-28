// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      resource: json['resource'] == null
          ? null
          : Resource.fromJson(json['resource'] as Map<String, dynamic>),
      resourceType:
          $enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
      userId: json['userId'] as String,
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      rank: json['rank'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'resource': instance.resource,
      'resourceType': _$ResourceTypeEnumMap[instance.resourceType],
      'userId': instance.userId,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'rank': instance.rank,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.photo: 'photo',
  ResourceType.message: 'message',
  ResourceType.none: 'none',
};
