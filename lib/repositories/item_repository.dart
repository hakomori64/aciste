import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseItemRepository {
  Future<Item> createItem({required Item item});
  Future<Item> updateItem({required Item item});
  Future<void> deleteItem({required String itemId});
  Future<bool> checkHasResource({required String resourceId});
}

class ItemRepositoryParams {
  final String userId;
  const ItemRepositoryParams({ required this.userId });
}

final itemRepositoryProvider = Provider.family<ItemRepository, ItemRepositoryParams>((ref, params) => ItemRepository(ref.read, params.userId));

class ItemRepository extends PagingRepository<Item> implements BaseItemRepository {
  final Reader _read;
  final String _userId;

  ItemRepository(this._read, this._userId);

  @override
  Future<void> initState() async {
    baseQuery = _read(firebaseFirestoreProvider)
      .userItemsRef(_userId)
      .orderBy('createdAt', descending: true);
    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
        }) async {
      final item = Item.fromDocumentSnapshot(doc);
      final resource = await _read(resourceRepositoryProvider).retrieveResource(
        resourceId: doc.data()!['resourceId'],
      );
      return item.copyWith(resource: resource);
    };

    await super.initState();
  }

  @override
  Future<Item> createItem({required Item item}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
        .userItemsRef(_userId)
        .add(item.toDocument());

      final doc = await docRef.get();

      return item.copyWith(id: docRef.id, doc: doc);

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Item> updateItem({required Item item}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userItemsRef(_userId)
        .doc(item.id)
        .update(item.toDocument());

      return item;

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userItemsRef(_userId)
        .doc(itemId)
        .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<bool> checkHasResource({required resourceId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .userItemsRef(_userId)
        .where('resourceId', isEqualTo: resourceId)
        .limit(1)
        .get();

      return snapshot.docs.isNotEmpty;

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}