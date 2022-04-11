import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/cache_repository.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'auth_controller.dart';

final cacheListControllerProvider = StateNotifierProvider<CacheListController, Pager<Cache>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return CacheListController(ref.read, user?.uid);
  }
);

class CacheListController extends StateNotifier<Pager<Cache>> with PagingMixin<Cache> {
  final Reader _read;
  final String? _userId;

  CacheListController(this._read, this._userId) : super(const Pager<Cache>()) {
    if (_userId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<Cache>> getPage() async {
    return _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).retrievePage(startAfterDoc: state.lastDoc);
  }

  @override
  Future<List<Cache>> getBeforePage() async {
    return _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).retrieveBeforePage(endBeforeDoc: state.firstDoc);
  }

  Future<void> addCache({
    required String description,
    required String title,
    required String body,
    required String createdBy,
    required List<Attachment> attachments,
  }) async {
    try {
      const uuid = Uuid();
      final tmpId = uuid.v4();
      final tmpCache = Cache.empty().copyWith(
        id: tmpId,
        description: description,
        resource: Resource.empty().copyWith(
          title: '読み込み中...'
        ),
      );
      state.data.whenData((caches) {
        caches.insert(0, tmpCache);
        state = state.copyWith(
          data: AsyncValue.data(caches)
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
      final newCache = Cache.empty().copyWith(
          resource: resource,
        );
      final created = await _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).createCache(
        cache: newCache
      );
      state.data.whenData((caches) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final cache in caches)
              if (cache.id == tmpId)
                created else cache
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

  Future<void> importCache({
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
      final cache = Cache.empty().copyWith(
        description: description,
        resource: resource,
        rank: rank
      );
      final created = await _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).createCache(
        cache: cache
      );
      state.data.whenData((caches) => state = state.copyWith(
        data: AsyncValue.data([created, ...caches]),
      ));

      managePage();
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<void> updateCache({
    required String cacheId,
    required String description,
    required String title,
    required String body,
    required String createdBy,
    required List<Attachment> attachments,
  }) async {
    try {
      final oldCache = state.data.asData!.value.firstWhere((cache) => cache.id == cacheId);
      final tmpCache = oldCache.copyWith(
        description: description,
        resource: oldCache.resource!.copyWith(
          title: '読み込み中'
        ),
      );
      state.data.whenData((caches) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final cache in caches)
              if (cache.id == tmpCache.id) tmpCache else cache
          ])
        );
      });
      final user = await _read(userRepositoryProvider).getUser(userId: createdBy);
      final resource = await _read(resourceControllerProvider).updateResource(
        resource: oldCache.resource!.copyWith(
          title: title,
          body: body,
          createdBy: user,
          attachments: attachments,
        )
      );
      final updatedCache = await _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).updateCache(cache: oldCache.copyWith(
        description: description,
        resource: resource,
      ));
      state.data.whenData((caches) {
        state = state.copyWith(
          data: AsyncValue.data([
            for (final cache in caches)
              if (cache.id == updatedCache.id) updatedCache else cache
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

  Future<void> deleteCache({required String cacheId}) async {
    try {
      await _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).deleteCache(
        cacheId: cacheId
      );

      state.data.whenData((caches) => state = state.copyWith(data: AsyncValue.data(caches..removeWhere((cache) => cache.id == cacheId))));

      managePage();
    } on CustomException catch (e) {
      state = state.copyWith(
        data: AsyncValue.error(e)
      );
    }
  }

  Future<bool> checkHasResource({required String resourceId}) async {
    return _read(cacheRepositoryProvider(CacheRepositoryParams(userId: _userId!))).checkHasResource(resourceId: resourceId);
  }
}