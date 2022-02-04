import 'package:aciste/enums/resource_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
abstract class Resource implements _$Resource {
  const Resource._();

  const factory Resource({
    String? id,
    required String createdBy,
    required String url,
    required ResourceType type,
  }) = _Resource;

  factory Resource.empty() => const Resource(
    createdBy: "",
    url: "",
    type: ResourceType.none
  );

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  factory Resource.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Resource.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}