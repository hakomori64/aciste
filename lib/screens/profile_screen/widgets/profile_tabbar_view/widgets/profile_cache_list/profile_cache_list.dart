import 'package:aciste/custom_exception.dart';
import 'package:aciste/controllers/profile_cache_list_controller.dart';
import './widgets/profile_cache_tile/profile_cache_tile.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCacheList extends HookConsumerWidget {
  const ProfileCacheList({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final cacheListState = ref.watch(profileCacheListControllerProvider);

    return cacheListState.data.when(
      data: (caches) => caches.isEmpty ? const SliverToBoxAdapter(
        child: Center(
          child: Text('あなたはまだこのユーザーのキャッシュを持っていません')
        ),
      ) : SliverList(
        delegate: SliverChildListDelegate(
          caches.map((cache) {
            return ProfileCacheTile(cache: cache);
          }).toList()
        ),
      ),
      loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
      error: (error, _) => SliverToBoxAdapter(
        child: SomethingWentWrong(
          message: error is CustomException ? error.message! : 'ユーザーのキャッシュの取得に失敗しました',
        ),
      )
    );
  }
}