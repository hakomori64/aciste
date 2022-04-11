// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cache _$$_CacheFromJson(Map<String, dynamic> json) => _$_Cache(
      id: json['id'] as String?,
      description: json['description'] as String,
      resource: json['resource'] == null
          ? null
          : Resource.fromJson(json['resource'] as Map<String, dynamic>),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      rank: json['rank'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CacheToJson(_$_Cache instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'resource': instance.resource,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'rank': instance.rank,
    };
