import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseCacheRepository {
  Future<Cache> retrieveCache({required String cacheId});
  Future<Cache> createCache({required Cache cache});
  Future<Cache> updateCache({required Cache cache});
  Future<void> deleteCache({required String cacheId});
  Future<bool> checkHasResource({required String resourceId});
}

class CacheRepositoryParams {
  final String userId;
  const CacheRepositoryParams({ required this.userId });
}

final cacheRepositoryProvider = Provider.family<CacheRepository, CacheRepositoryParams>((ref, params) => CacheRepository(ref.read, params.userId));

class CacheRepository extends PagingRepository<Cache> implements BaseCacheRepository {
  final Reader _read;
  final String _userId;

  CacheRepository(this._read, this._userId);

  @override
  Future<void> initState() async {
    baseQuery = _read(firebaseFirestoreProvider)
      .userCachesRef(_userId)
      .orderBy('createdAt', descending: true);
    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
        }) async {
      final cache = Cache.fromDocumentSnapshot(doc);
      final resource = await _read(resourceRepositoryProvider).retrieveResource(
        resourceId: doc.data()!['resourceId'],
      );
      return cache.copyWith(resource: resource);
    };

    await super.initState();
  }

  @override
  Future<Cache> retrieveCache({required String cacheId}) async {
    if (converter == null) {
      await initState();
    }

    try {
      final doc = await _read(firebaseFirestoreProvider)
        .userCachesRef(_userId)
        .doc(cacheId).get();

      return converter!(doc: doc);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Cache> createCache({required Cache cache}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
        .userCachesRef(_userId)
        .add(cache.toDocument());

      final doc = await docRef.get();

      return cache.copyWith(id: docRef.id, doc: doc);

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Cache> updateCache({required Cache cache}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userCachesRef(_userId)
        .doc(cache.id)
        .update(cache.toDocument());

      return cache;

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteCache({required String cacheId}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userCachesRef(_userId)
        .doc(cacheId)
        .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<bool> checkHasResource({required resourceId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .userCachesRef(_userId)
        .where('resourceId', isEqualTo: resourceId)
        .limit(1)
        .get();

      return snapshot.docs.isNotEmpty;

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}