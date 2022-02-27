import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
abstract class Video with _$Video implements Resource {
  const Video._();

  const factory Video({
    String? id,
    @Default("") String name,
    @Default("") String description,
    User? createdBy,
    String? url,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @Default(0) int viewCount,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  factory Video.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Video.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('createdBy');
    
    data['createdById'] = createdBy?.id ?? '';

    return data;
  }
}