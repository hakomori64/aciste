import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/item_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'auth_controller.dart';

final itemListControllerProvider = StateNotifierProvider<ItemListController, AsyncValue<List<Item>>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return ItemListController(ref.read, user?.uid);
  }
);

class ItemListController extends StateNotifier<AsyncValue<List<Item>>> {
  final Reader _read;
  final String? _userId;

  ItemListController(this._read, this._userId) : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveItems();
    }
  }

  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final items = await _read(itemRepositoryProvider).retrieveItems(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> addItem({
    required String name,
    required String description,
    required String createdBy,
    required ResourceType resourceType,
    required CreateResourceParams content,
  }) async {
    try {
      const uuid = Uuid();
      final tmpId = uuid.v4();
      final tmpItem = Item.empty().copyWith(
        id: tmpId,
        name: name,
        description: description,
        resource: null,
        resourceType: ResourceType.loading,
        userId: _userId!,
      );
      state.whenData((items) {
        items.insert(0, tmpItem);
        state = AsyncValue.data(items);
      });
      final resource = await _read(resourceControllerProvider).createResource(
        resourceType: resourceType,
        content: content
      );

      if (_userId == null || resource.id == null) {
        throw const CustomException(message: 'resourceId or userId is null');
      }
      final newItem = Item.empty().copyWith(
          name: name,
          description: description,
          resource: resource,
          resourceType: resourceType,
          userId: _userId!,
        );
      final itemId = await _read(itemRepositoryProvider).createItem(
        userId: _userId!,
        item: newItem
      );
      state.whenData((items) {
        state = AsyncValue.data([
          for (final item in items)
            if (item.id == tmpId)
              newItem.copyWith(id: itemId) else item
        ]);
      });
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> importItem({
    required String name,
    required String description,
    required Resource resource,
    required ResourceType resourceType,
    required String? userId,
    required int rank,
  }) async {
    if (userId == null) {
      state = const AsyncValue.error(CustomException(message: 'ログインが済んでいません'));
      return;
    }

    try {
      final item = Item.empty().copyWith(
        name: name,
        description: description,
        resource: resource,
        resourceType: resourceType,
        userId: userId,
        rank: rank
      );
      final itemId = await _read(itemRepositoryProvider).createItem(
        userId: userId,
        item: item
      );
      state.whenData((items) => state = AsyncValue.data(items..add(item.copyWith(id: itemId))));
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> updateItem({required Item updatedItem}) async {
    try {
      await _read(itemRepositoryProvider).updateItem(userId: _userId!, item: updatedItem);
      state.whenData((items) {
        state = AsyncValue.data([
          for (final item in items)
            if (item.id == updatedItem.id) updatedItem else item
        ]);
      });
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(itemRepositoryProvider).deleteItem(
        userId: _userId!,
        itemId: itemId
      );

      state.whenData((items) => state = AsyncValue.data(items..removeWhere((item) => item.id == itemId)));
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<bool> checkHasResource({required String resourceId}) async {
    return _read(itemRepositoryProvider).checkHasResource(userId: _userId!, resourceId: resourceId);
  }
}