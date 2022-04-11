import 'package:aciste/screens/cmap_create_screen/controllers/cmap_create_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cmap_confirm/cmap_confirm.dart';
import 'widgets/cmap_detail/cmap_detail.dart';
import 'widgets/cmap_cache/cmap_cache.dart';
import 'widgets/next_button/next_button.dart';

class CMapCreateScreen extends HookConsumerWidget {
  const CMapCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final cMapCreateScreenState = ref.watch(cMapCreateScreenControllerProvider);
    final page = cMapCreateScreenState.page;
    final pageController = usePageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: page > 0 ? IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            pageController.jumpToPage(page - 1);
          }
        ) : null,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NextButton(page: page, onPressed: () async {
              switch (page) {
                case 0:
                  pageController.jumpToPage(page + 1);
                  break;
                case 1:
                  pageController.jumpToPage(page + 1);
                  break;
                case 2:
                  break;
                default:
                  break;
              }
            }),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: ref.read(cMapCreateScreenControllerProvider.notifier).setPage,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CMapDetail(),
          CMapCache(),
          CMapConfirm(),
        ],
      )
    );
  }
}