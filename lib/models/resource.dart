import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aciste/models/attachment.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    String? id,
    required String title,
    required String body,
    @Default(0) int viewCount,
    User? createdBy,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @Default([]) List<Attachment> attachments,
  }) = _Resource;

  factory Resource.empty() => Resource(
    title: "",
    body: "",
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
      ..remove('attachments')
      ..remove('createdBy');
    
    data['createdById'] = createdBy?.id ?? '';
    
    return data;
  }
}