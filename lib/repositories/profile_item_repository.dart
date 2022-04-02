import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileItemRepositoryParams {
  final String userId;
  final String? resourceCreatedById;
  const ProfileItemRepositoryParams({ required this.userId, this.resourceCreatedById });
}

abstract class BaseProfileItemRepository {}

final profileItemRepositoryProvider = Provider.family<ProfileItemRepository, ProfileItemRepositoryParams>((ref, params) => ProfileItemRepository(ref.read, params.userId, params.resourceCreatedById));

class ProfileItemRepository extends PagingRepository<Item> implements BaseProfileItemRepository {
  final Reader _read;
  final String _userId;
  final String? _resourceCreatedById;

  ProfileItemRepository(this._read, this._userId, this._resourceCreatedById);

  @override
  Future<void> initState() async {
    baseQuery = _read(firebaseFirestoreProvider)
      .userItemsRef(_userId)
      .where('resourceCreatedById', isEqualTo: _resourceCreatedById)
      .orderBy('createdAt', descending: true);
    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
    }) async {
      final item = Item.fromDocumentSnapshot(doc);
      final resource = await _read(resourceRepositoryProvider).retrieveResource(resourceId: doc.data()!['resourceId']);
      return item.copyWith(resource: resource);
    };

    await super.initState();
  }
}