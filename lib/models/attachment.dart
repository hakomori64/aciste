import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const Attachment._();

  const factory Attachment({
    String? id,
    required AttachmentType type,
    AttachmentData? data,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _Attachment;

  factory Attachment.empty() => Attachment(
    id: null,
    type: AttachmentType.none,
    data: null,
    createdAt: DateTime.now(),
  );

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  factory Attachment.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Attachment.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final json = toJson()
      ..remove('id')
      ..remove('data');
    
    json['dataId'] = data!.id ?? '';
    return json;
  }
}