import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCacheRepositoryParams {
  final String userId;
  final String? resourceCreatedById;
  const ProfileCacheRepositoryParams({ required this.userId, this.resourceCreatedById });
}

abstract class BaseProfileCacheRepository {}

final profileCacheRepositoryProvider = Provider.family<ProfileCacheRepository, ProfileCacheRepositoryParams>((ref, params) => ProfileCacheRepository(ref.read, params.userId, params.resourceCreatedById));

class ProfileCacheRepository extends PagingRepository<Cache> implements BaseProfileCacheRepository {
  final Reader _read;
  final String _userId;
  final String? _resourceCreatedById;

  ProfileCacheRepository(this._read, this._userId, this._resourceCreatedById);

  @override
  Future<void> initState() async {
    baseQuery = _read(firebaseFirestoreProvider)
      .userCachesRef(_userId)
      .where('resourceCreatedById', isEqualTo: _resourceCreatedById)
      .orderBy('createdAt', descending: true);
    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
    }) async {
      final cache = Cache.fromDocumentSnapshot(doc);
      final resource = await _read(resourceRepositoryProvider).retrieveResource(resourceId: doc.data()!['resourceId']);
      return cache.copyWith(resource: resource);
    };

    await super.initState();
  }
}