import 'package:aciste/constants.dart';
import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

abstract class BaseProfileItemRepository {
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsPage({required String userId, required String resourceCreatedBy, int pageSize, DocumentSnapshot? startAfterDoc});
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsBeforePage({required String userId, required String resourceCreatedBy, int pageSize, DocumentSnapshot? endBeforeDoc});
}

final profileItemRepositoryProvider = Provider<ProfileItemRepository>((ref) => ProfileItemRepository(ref.read));

class ProfileItemRepository implements BaseProfileItemRepository {
  final Reader _read;

  const ProfileItemRepository(this._read);

  Future<Item> _getItem({
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) async {
    final item = Item.fromDocumentSnapshot(doc);
    final resource = await _read(resourceRepositoryProvider).retrieveResource(resourceId: doc.data()!['resourceId']);
    return item.copyWith(resource: resource);
  }

  @override
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsPage({required String userId, required String resourceCreatedBy, int pageSize = defaultPageSize, DocumentSnapshot? startAfterDoc }) async {
    try {
      if (startAfterDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .where('resourceCreatedById', isEqualTo: resourceCreatedBy)
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
          .where('resourceCreatedById', isEqualTo: resourceCreatedBy)
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
  Future<Tuple3<List<Item>, DocumentSnapshot?, DocumentSnapshot?>> retrieveItemsBeforePage({required String userId, required String resourceCreatedBy, int pageSize = defaultPageSize, DocumentSnapshot? endBeforeDoc }) async {
    try {
      if (endBeforeDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .userItemsRef(userId)
          .where('resourceCreatedById', isEqualTo: resourceCreatedBy)
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
          .where('resourceCreatedById', isEqualTo: resourceCreatedBy)
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
}