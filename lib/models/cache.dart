import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'cache.freezed.dart';
part 'cache.g.dart';

@freezed
abstract class Cache with _$Cache implements PagingItem {
  const Cache._();

  const factory Cache({
    String? id,
    required String description,
    Resource? resource,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @Default(0) int rank,
    @JsonKey(ignore: true) DocumentSnapshot? doc,
  }) = _Cache;

  factory Cache.empty() => Cache(
    description: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory Cache.fromJson(Map<String, dynamic> json) => _$CacheFromJson(json);

  factory Cache.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Cache.fromJson(data).copyWith(id: doc.id, doc: doc);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('resource');
    data['resourceId'] = resource?.id ?? '';
    data['resourceCreatedById'] = resource?.createdBy?.id ?? '';
    return data;
  }
}