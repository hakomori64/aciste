import 'package:aciste/controllers/cache_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cache_tile/cache_tile.dart';

class CacheList extends HookConsumerWidget {
  const CacheList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheListState = ref.watch(cacheListControllerProvider);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() async {
        if (scrollController.offset == scrollController.position.maxScrollExtent) {
          await ref.read(cacheListControllerProvider.notifier).retrievePage();
        } else if (scrollController.offset <= 0) {
          await ref.read(cacheListControllerProvider.notifier).retrieveBeforePage();
        }
      });

      return;
    }, [scrollController]);

    return cacheListState.data.when(
      data: (caches) => caches.isEmpty ? const Center(
        child: Text('まだキャッシュはありません！', style: TextStyle(fontSize: 20.0))
      ) : ListView.builder(
        controller: scrollController,
        itemCount: caches.length,
        itemBuilder: (context, index) {
          final cache = caches[index];
          if (index == caches.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CacheTile(cache: cache)
            );
          }
          return CacheTile(cache: cache);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => SomethingWentWrong(
        message: error is CustomException ? error.message! : 'Something went wrong'
      )
    );
  }
}
