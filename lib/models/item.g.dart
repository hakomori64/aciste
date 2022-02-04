// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      createdBy: json['createdBy'] as String,
      resourceUrl: json['resourceUrl'] as String,
      resourceType: $enumDecode(_$ResourceTypeEnumMap, json['resourceType']),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'resourceUrl': instance.resourceUrl,
      'resourceType': _$ResourceTypeEnumMap[instance.resourceType],
    };

const _$ResourceTypeEnumMap = {
  ResourceType.photo: 'photo',
  ResourceType.none: 'none',
};
