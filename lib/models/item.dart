import 'package:aciste/enums/resource_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required String createdBy,
    required String resourceUrl,
    required ResourceType resourceType,
  }) = _Item;

  factory Item.empty() => const Item(
    name: "",
    description: "",
    createdBy: "",
    resourceUrl: "",
    resourceType: ResourceType.none
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Item.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}