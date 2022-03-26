// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Photo _$$_PhotoFromJson(Map<String, dynamic> json) => _$_Photo(
      id: json['id'] as String?,
      url: json['url'] as String?,
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
    };
