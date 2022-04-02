import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pager.freezed.dart';

abstract class PagingItem {
  DocumentSnapshot? get doc;
}

@freezed
abstract class Pager<T extends PagingItem> with _$Pager<T> {
  const factory Pager({
    @Default(AsyncValue.loading()) AsyncValue<List<T>> data,
    DocumentSnapshot? firstDoc,
    DocumentSnapshot? lastDoc,
  }) = _Pager;
}

