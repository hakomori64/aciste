import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const Item._();

  const factory Item({
    String? id,
    required String description,
    Resource? resource,
    required String userId,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @Default(0) int rank,
  }) = _Item;

  factory Item.empty() => Item(
    description: "",
    userId: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Item.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('resource');
    data['resourceId'] = resource?.id ?? '';
    return data;
  }
}