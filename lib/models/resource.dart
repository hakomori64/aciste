import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
abstract class Resource implements _$Resource {
  const Resource._();

  const factory Resource({
    String? id,
    User? createdBy,
    required String url,
    required ResourceType type,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _Resource;

  factory Resource.empty() => Resource(
    url: "",
    type: ResourceType.none,
    createdAt: DateTime.now()
  );

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  factory Resource.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Resource.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('createdBy');
    
    data['createdById'] = createdBy?.id ?? '';

    return data;
  }
}