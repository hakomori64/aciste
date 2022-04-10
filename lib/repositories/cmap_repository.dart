import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/cmap.dart';
import 'package:aciste/repositories/item_repository.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/providers.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseCMapRepository {

}

class CMapRepositoryParams {
  final String userId;
  const CMapRepositoryParams({ required this.userId });
}

final cMapRepositoryProvider = Provider.family<CMapRepository, CMapRepositoryParams>((ref, params) => CMapRepository(ref.read, params.userId));

class CMapRepository extends PagingRepository<CMap> implements BaseCMapRepository {
  final Reader _read;
  final String _userId;

  CMapRepository(this._read, this._userId);

  @override
  Future<void> initState() async {
    final user = await _read(userRepositoryProvider).getUser(userId: _userId);
    baseQuery = _read(firebaseFirestoreProvider)
      .cMapsRef()
      .where('userId', whereIn: [user!.id!, ...user.following])
      .orderBy('createdAt', descending: true);

    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
    }) async {
      final cmap = CMap.fromDocumentSnapshot(doc);
      final user = await _read(userRepositoryProvider).getUser(userId: doc.data()!['userId']);
      final item = await _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId))).retrieveItem(itemId: doc.data()!['itemId']);

      return cmap.copyWith(
        item: item,
        user: user
      );
    };
  }

}