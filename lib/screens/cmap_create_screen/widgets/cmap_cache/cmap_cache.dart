import 'package:aciste/screens/cmap_create_screen/controllers/cmap_create_screen_controller.dart';
import 'package:aciste/screens/main_screen/widgets/cache_screen/widgets/cache_list/widgets/cache_tile/cache_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CMapCache extends HookConsumerWidget {
  const CMapCache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheCreateScreenState = ref.watch(cMapCreateScreenControllerProvider);
    final cache = cacheCreateScreenState.cache;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: (cache != null) ? CacheTile(cache: cache) : Container()
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      )
                    ),
                    onPressed: () async {
                    },
                    child: const Text('キャッシュを選択する', style: TextStyle(fontSize: 18, color: Colors.white)),
                  )
                )
              ],
            )
          )
        ],
      )
    );
  }
}