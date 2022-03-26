import 'dart:io';

import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo implements AttachmentData {
  const Photo._();

  const factory Photo({
    String? id,
    String? url,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _Photo;

  factory Photo.empty() => Photo(
    createdAt: DateTime.now()
  );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  factory Photo.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Photo.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id');

    return data;
  }
}

class CreatePhotoParams extends CreateAttachmentDataParams {
  final File file;
  CreatePhotoParams({required this.file });
}
