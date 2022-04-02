import 'package:aciste/constants.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// PagingRepository
/// **Please Implement**
/// - Future<void> initState()
class PagingRepository<T extends PagingItem> {
  Query<Map<String, dynamic>>? baseQuery;
  Future<T> Function({ required DocumentSnapshot<Map<String, dynamic>> doc })? converter;

  PagingRepository() {
    initState();
  }

  Future<void> initState() async {
  }

  Future<List<T>> retrievePage({
    DocumentSnapshot? startAfterDoc,
    int pageSize = defaultPageSize,
  }) async {
    if (baseQuery == null || converter == null) {
      await initState();
    }
    var _query = baseQuery;
    if (startAfterDoc != null) {
      _query = _query!.startAfterDocument(startAfterDoc);
    }
    final snapshot = await _query!.limit(pageSize).get();

    return Future.wait(snapshot.docs.map((doc) => converter!(doc: doc)).toList());
  }

  Future<List<T>> retrieveBeforePage({
    DocumentSnapshot? endBeforeDoc,
    int pageSize = defaultPageSize,
  }) async {
    if (baseQuery == null || converter == null) {
      await initState();
    }
    var _query = baseQuery;
    if (endBeforeDoc != null) {
      _query = _query!.endBeforeDocument(endBeforeDoc);
    }
    final snapshot = await _query!.limit(pageSize).get();

    return Future.wait(snapshot.docs.map((doc) => converter!(doc: doc)).toList());
  }


}
