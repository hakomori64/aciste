import 'package:aciste/constants.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:tuple/tuple.dart';

abstract class BaseItemRepository {
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsPage({required String userId, int pageSize, DocumentSnapshot? startAfterDoc });
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsBeforePage({required String userId, int pageSize, DocumentSnapshot? endBeforeDoc });
  Future<Tuple2<DocumentSnapshot, Item>> createItem({required String userId, required Item item});
  Future<Item> updateItem({required String userId, required Item item});
  Future<void> deleteItem({required String userId, required String itemId});
  Future<bool> checkHasResource({required String userId, required String resourceId});
}

final itemRepositoryProvider = Provider<ItemRepository>((ref) => ItemRepository(ref.read));

class ItemRepository implements BaseItemRepository {
  final Reader _read;

  const ItemRepository(this._read);

  Future<Item> _getItem({
    required DocumentSnapshot<Map<String, dynamic>> doc,
      }) async {
    final item = Item.fromDocumentSnapshot(doc);
    final resource = await _read(resourceRepositoryProvider).retrieveResource(
      resourceId: doc.data()!['resourceId'],
    );
    return item.copyWith(resource: resource);
  }

  @override
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsPage({required String userId, int pageSize = defaultPageSize, DocumentSnapshot? startAfterDoc }) async {
    try {
      if (startAfterDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .orderBy('createdAt', descending: true)
          .startAfterDocument(startAfterDoc)
          .limit(pageSize)
          .get();

        final items = await Future.wait(snapshot.docs.map((doc) => _getItem(
          doc: doc
        )).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(items, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(items, null, null);
        }
      } else {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .orderBy('createdAt', descending: true)
          .limit(pageSize)
          .get();

        final items = await Future.wait(snapshot.docs.map((doc) => _getItem(
          doc: doc
        )).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(items, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(items, null, null);
        }
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsBeforePage({required String userId, int pageSize = defaultPageSize, DocumentSnapshot? endBeforeDoc }) async {
    try {
      if (endBeforeDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .orderBy('createdAt', descending: true)
          .endBeforeDocument(endBeforeDoc)
          .limit(pageSize)
          .get();

        final items = await Future.wait(snapshot.docs.map((doc) => _getItem(
          doc: doc
        )).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(items, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(items, null, null);
        }
      } else {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .orderBy('createdAt', descending: true)
          .limit(pageSize)
          .get();

        final items = await Future.wait(snapshot.docs.map((doc) => _getItem(
          doc: doc
        )).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(items, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(items, null, null);
        }
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Tuple2<DocumentSnapshot, Item>> createItem({required String userId, required Item item}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .add(item.toDocument());

      final doc = await docRef.get();

      return Tuple2(doc, item.copyWith(id: docRef.id, doc: doc));
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Item> updateItem({required String userId, required Item item}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userItemsRef(userId)
        .doc(item.id)
        .update(item.toDocument());

      return item;

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