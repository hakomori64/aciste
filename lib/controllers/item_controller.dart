import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/item_repository.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'auth_controller.dart';

final itemListControllerProvider = StateNotifierProvider<ItemListController, Pager<Item>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return ItemListController(ref.read, user?.uid);
  }
);

class ItemListController extends StateNotifier<Pager<Item>> with PagingMixin<Item> {
  final Reader _read;
  final String? _userId;

  ItemListController(this._read, this._userId) : super(const Pager<Item>()) {
    if (_userId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<Item>> getPage() async {
    return _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).retrievePage(startAfterDoc: state.lastDoc);
  }

  @override
  Future<List<Item>> getBeforePage() async {
    return _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).retrieveBeforePage(endBeforeDoc: state.firstDoc);
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
        );
      final created = await _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).createItem(
        item: newItem
      );
      state.data.whenData((items) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final item in items)
              if (item.id == tmpId)
                created else item
          ]),
        );
      });

      managePage();
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
        rank: rank
      );
      final created = await _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).createItem(
        item: item
      );
      state.data.whenData((items) => state = state.copyWith(
        data: AsyncValue.data([created, ...items]),
      ));

      managePage();
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
      final updatedItem = await _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).updateItem(item: oldItem.copyWith(
        description: description,
        resource: resource,
      ));
      state.data.whenData((items) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final item in items)
              if (item.id == updatedItem.id) updatedItem else item
          ])
        );
      });

      managePage();
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).deleteItem(
        itemId: itemId
      );

      state.data.whenData((items) => state = state.copyWith(data: AsyncValue.data(items..removeWhere((item) => item.id == itemId))));

      managePage();
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<bool> checkHasResource({required String resourceId}) async {
    return _read(itemRepositoryProvider(ItemRepositoryParams(userId: _userId!))).checkHasResource(resourceId: resourceId);
  }
}