import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item implements _$Item {
  const Item._();

  const factory Item({
    String? id,
    required String name,
    required String description,
    Resource? resource,
    ResourceType? resourceType,
    required String userId,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
  }) = _Item;

  factory Item.empty() => Item(
    name: "",
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