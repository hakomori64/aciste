import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseItemRepository {
  Future<List<Item>> retrieveItems({required String userId});
  Future<String> createItem({required String userId, required Item item});
  Future<void> updateItem({required String userId, required Item item});
  Future<void> deleteItem({required String userId, required String itemId});
}

final itemRepositoryProvider = Provider<ItemRepository>((ref) => ItemRepository(ref.read));

class ItemRepository implements BaseItemRepository {
  final Reader _read;

  const ItemRepository(this._read);

  @override
  Future<List<Item>> retrieveItems({required String userId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .get();
      
      return snapshot.docs.map((doc) => Item.fromDocumentSnapshot(doc)).toList();
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
}