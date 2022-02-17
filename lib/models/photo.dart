import 'dart:io';

import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo extends Resource implements _$Photo {
  const Photo._();

  const factory Photo({
    String? id,
    User? createdBy,
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
      ..remove('id')
      ..remove('createdBy');
    
    data['createdById'] = createdBy?.id ?? '';

    return data;
  }
}

class CreatePhotoParams extends CreateResourceParams {
  final File file;
  CreatePhotoParams({required this.file });
}
