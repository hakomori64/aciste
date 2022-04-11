import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/enums/cmap_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cmap.freezed.dart';
part 'cmap.g.dart';

@freezed
abstract class CMap with _$CMap implements PagingItem {
  const CMap._();

  const factory CMap({
    String? id,
    required String message,
    required String password,
    required String link,
    @Default(CMapType.password) type,
    Cache? cache,
    User? user,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @Default([]) List<Attachment> attachments,
    @JsonKey(ignore: true) DocumentSnapshot? doc,
  }) = _CMap;

  factory CMap.empty() => CMap(
    message: '',
    password: '',
    link: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory CMap.fromJson(Map<String ,dynamic> json) => _$CMapFromJson(json);

  factory CMap.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return CMap.fromJson(data).copyWith(id: doc.id, doc: doc);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('cache')
      ..remove('user')
      ..remove('attachments');

    data['cacheId'] = cache?.id ?? '';
    data['userId'] = user?.id ?? '';

    return data;
  }
}