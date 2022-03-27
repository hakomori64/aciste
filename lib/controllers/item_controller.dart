import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/item_repository.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_controller.dart';

part 'item_controller.freezed.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState({
    @Default(AsyncValue.loading()) AsyncValue<List<Item>> data,
    DocumentSnapshot? firstDoc,
    DocumentSnapshot? lastDoc,
  }) = _ItemListState;
}

final itemListControllerProvider = StateNotifierProvider<ItemListController, ItemListState>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return ItemListController(ref.read, user?.uid);
  }
);

class ItemListController extends StateNotifier<ItemListState> {
  final Reader _read;
  final String? _userId;

  ItemListController(this._read, this._userId) : super(const ItemListState()) {
    if (_userId != null) {
      retrieveItemsPage();
    }
  }

  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) {
      state = state.copyWith(
        data: const AsyncValue.loading()
      );
    }
    try {
      final items = await _read(itemRepositoryProvider).retrieveItems(userId: _userId!);
      if (mounted) {
        state = state.copyWith(
          data: AsyncValue.data(items)
        );
      }
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> retrieveItemsPage() async {
    try {
      final result = await _read(itemRepositoryProvider).retrieveItemsPage(userId: _userId!, startAfterDoc: state.lastDoc);
      final items = result.item1;
      final firstDoc = result.item2;
      final lastDoc = result.item3;

      state = state.copyWith(
        data: AsyncValue.data([
          ...(state.data.asData?.value ?? []),
          ...items,
        ]),
        firstDoc: state.firstDoc ?? firstDoc,
        lastDoc: lastDoc ?? state.lastDoc,
      );
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> retrieveItemsBeforePage() async {
    try {
      final result = await _read(itemRepositoryProvider).retrieveItemsBeforePage(userId: _userId!, endBeforeDoc: state.firstDoc);
      final items = result.item1;
      final firstDoc = result.item2;
      final lastDoc = result.item3;

      state = state.copyWith(
        data: AsyncValue.data([
          ...items,
          ...(state.data.asData?.value ?? []),
        ]),
        firstDoc: firstDoc ?? state.firstDoc,
        lastDoc: state.lastDoc ?? lastDoc,
      );
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> addItem({
    required String description,
    required String title,
    required String body,
    required String createdBy,
    required List<Attachment> attachments,
  }) async {
    try {
      const uuid = Uuid();
      final tmpId = uuid.v4();
      final tmpItem = Item.empty().copyWith(
        id: tmpId,
        description: description,
        resource: Resource.empty().copyWith(
          title: '読み込み中...'
        ),
        userId: _userId!,
      );
      state.data.whenData((items) {
        items.insert(0, tmpItem);
        state = state.copyWith(
          data: AsyncValue.data(items)
        );
      });
      final user = await _read(userRepositoryProvider).getUser(userId: createdBy);
      final resource = await _read(resourceControllerProvider).createResource(
        resource: Resource.empty().copyWith(
          title: title,
          body: body,
          createdBy: user,
          attachments: attachments,
        )
      );

      if (_userId == null || resource.id == null) {
        throw const CustomException(message: 'resourceId or userId is null');
      }
      final newItem = Item.empty().copyWith(
          resource: resource,
          userId: _userId!,
        );
      final created = await _read(itemRepositoryProvider).createItem(
        item: newItem
      );
      state.data.whenData((items) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final item in items)
              if (item.id == tmpId)
                created else item
          ])
        );
      });
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<void> importItem({
    required String description,
    required Resource resource,
    required String? userId,
    required int rank,
  }) async {
    if (userId == null) {
      state = state.copyWith(
        data: const AsyncValue.error(CustomException(message: 'ログインが済んでいません'))
      );
      return;
    }

    try {
      final item = Item.empty().copyWith(
        description: description,
        resource: resource,
        userId: userId,
        rank: rank
      );
      final created = await _read(itemRepositoryProvider).createItem(
        item: item
      );
      state.data.whenData((items) => state = state.copyWith(data: AsyncValue.data([created, ...items])));
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<void> updateItem({
    required String itemId,
    required String description,
    required String title,
    required String body,
    required String createdBy,
    required List<Attachment> attachments,
  }) async {
    try {
      final oldItem = state.data.asData!.value.firstWhere((item) => item.id == itemId);
      final tmpItem = oldItem.copyWith(
        description: description,
        resource: oldItem.resource!.copyWith(
          title: '読み込み中'
        ),
        userId: _userId!
      );
      state.data.whenData((items) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final item in items)
              if (item.id == tmpItem.id) tmpItem else item
          ])
        );
      });
      final user = await _read(userRepositoryProvider).getUser(userId: createdBy);
      final resource = await _read(resourceControllerProvider).updateResource(
        resource: oldItem.resource!.copyWith(
          title: title,
          body: body,
          createdBy: user,
          attachments: attachments,
        )
      );
      final updatedItem = await _read(itemRepositoryProvider).updateItem(item: oldItem.copyWith(
        description: description,
        resource: resource,
        userId: _userId!,
      ));
      state.data.whenData((items) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final item in items)
              if (item.id == updatedItem.id) updatedItem else item
          ])
        );
      });
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(itemRepositoryProvider).deleteItem(
        userId: _userId!,
        itemId: itemId
      );

      state.data.whenData((items) => state = state.copyWith(data: AsyncValue.data(items..removeWhere((item) => item.id == itemId))));
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<bool> checkHasResource({required String resourceId}) async {
    return _read(itemRepositoryProvider).checkHasResource(userId: _userId!, resourceId: resourceId);
  }
}