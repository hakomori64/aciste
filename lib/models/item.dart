import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item implements PagingItem {
  const Item._();

  const factory Item({
    String? id,
    required String description,
    Resource? resource,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @Default(0) int rank,
    @JsonKey(ignore: true) DocumentSnapshot? doc,
  }) = _Item;

  factory Item.empty() => Item(
    description: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Item.fromJson(data).copyWith(id: doc.id, doc: doc);
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