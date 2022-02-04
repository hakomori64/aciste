// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Resource _$$_ResourceFromJson(Map<String, dynamic> json) => _$_Resource(
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String,
      url: json['url'] as String,
      type: $enumDecode(_$ResourceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_ResourceToJson(_$_Resource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'url': instance.url,
      'type': _$ResourceTypeEnumMap[instance.type],
    };

const _$ResourceTypeEnumMap = {
  ResourceType.photo: 'photo',
  ResourceType.none: 'none',
};
