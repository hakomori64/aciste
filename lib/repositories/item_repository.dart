import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseItemRepository {
  Future<List<Item>> retrieveItems({required String userId});
  Future<String> createItem({required String userId, required Item item});
  Future<void> updateItem({required String userId, required Item item});
  Future<void> deleteItem({required String userId, required String itemId});
  Future<bool> checkHasResource({required String userId, required String resourceId});
}

final itemRepositoryProvider = Provider<ItemRepository>((ref) => ItemRepository(ref.read));

class ItemRepository implements BaseItemRepository {
  final Reader _read;

  const ItemRepository(this._read);

  Future<Item> _getItem({
    required DocumentSnapshot<Map<String, dynamic>> doc,
    required String userId
      }) async {
    final item = Item.fromDocumentSnapshot(doc);
    final resourceType = item.resourceType;
    final resource = await _read(resourceRepositoryProvider).retrieveResource(
      resourceType: resourceType!,
      resourceId: doc.data()!['resourceId'],
      userId: userId
    );
    return item.copyWith(resource: resource);
  }

  @override
  Future<List<Item>> retrieveItems({required String userId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .orderBy('createdAt', descending: true)
        .get();
      
      return Future.wait(snapshot.docs.map((doc) => _getItem(
        userId: userId,
        doc: doc
      )).toList());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createItem({required String userId, required Item item}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .add(item.toDocument());
      
      if (item.resource?.createdBy?.id == userId) {
        await _read(resourceRepositoryProvider).updateResource(
          userId: userId,
          resourceType: item.resourceType!,
          resource: item.resource!.copyWith(
            name: item.name,
            description: item.description,
          )
        );
      }
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateItem({required String userId, required Item item}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .doc(item.id)
        .update(item.toDocument());
      
      if (item.resource?.createdBy?.id == userId) {
        await _read(resourceRepositoryProvider).updateResource(
          userId: userId,
          resourceType: item.resourceType!,
          resource: item.resource!.copyWith(
            name: item.name,
            description: item.description,
          )
        );
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteItem({required String userId, required String itemId}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .doc(itemId)
        .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<bool> checkHasResource({required userId, required resourceId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .where('resourceId', isEqualTo: resourceId)
        .limit(1)
        .get();
      
      return snapshot.docs.isNotEmpty;
      
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}