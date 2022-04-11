import 'package:aciste/controllers/cmap_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cmap_tile/cmap_tile.dart';

class CMapList extends HookConsumerWidget {
  const CMapList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheListState = ref.watch(cMapListControllerProvider);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() async {
        if (scrollController.offset == scrollController.position.maxScrollExtent) {
          await ref.read(cMapListControllerProvider.notifier).retrievePage();
        } else {
          await ref.read(cMapListControllerProvider.notifier).retrieveBeforePage();
        }
      });

      return;
    }, [scrollController]);

    return cacheListState.data.when(
      data: (cMaps) => cMaps.isEmpty ? const Center(
        child: Text('まだキャッシュがありません。ユーザーをフォローしましょう！', style: TextStyle(fontSize: 20.0))
      ) : ListView.builder(
        controller: scrollController,
        itemCount: cMaps.length,
        itemBuilder: (context, index) {
          final cMap = cMaps[index];
          if (index == cMaps.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CMapTile(cMap: cMap)
            );
          }
          return CMapTile(cMap: cMap);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => SomethingWentWrong(
        message: error is CustomException ? error.message! : 'Something went wrong',
      )
    );
  }
}