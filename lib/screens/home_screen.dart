import 'package:aciste/constants.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/controllers/user_controller.dart';

import './home_screen/item_list.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userControllerState = ref.watch(userControllerProvider);
    final homeScreenControllerState = ref.watch(homeScreenControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        if (homeScreenControllerState.isSelecting) {
          ref.read(homeScreenControllerProvider.notifier).setIsSelecting(value: false);
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            const ItemList(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: PreferredSize(
                preferredSize: const Size.fromHeight(100.0),
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Theme.of(context).primaryColor,
                  title: const Text('aciste'),
                  leading: userControllerState.when(
                    data: (user) => Container(
                      padding: const EdgeInsets.all(10),
                      child: ClipOval(
                        child: GestureDetector(
                          onTap: () {
                            debugPrint("hello");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                            ),
                            child: Image.network(user?.photoUrl ?? defaultUserPhotoUrl)
                          )
                        )
                      ),
                    ),
                    loading: () => const SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
                    error: (error, _) => Text(error is CustomException ? error.message! : 'Something went wrong'),
                  )
                ),

              )
              
            ),
            if (homeScreenControllerState.isSelecting) Material(
              type: MaterialType.transparency,
              child: GestureDetector(
                onTap: () => ref.read(homeScreenControllerProvider.notifier).setIsSelecting(value: false),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ),
          ]
        ),
        floatingActionButton: homeScreenControllerState.isSelecting
        ? Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: RawMaterialButton(
                onPressed: () {
                  ref.read(homeScreenControllerProvider.notifier).setIsSelecting(value: false);
                  ref.read(routerProvider.notifier).push(route: Routes.itemCreate, extra: ResourceType.photo);
                },
                elevation: 2.0,
                fillColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.photo, size: 50.0, color: Colors.white),
                shape: const CircleBorder(),
              )
            )
          ],
        )
        : Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: RawMaterialButton(
                onPressed: () {
                  ref.read(homeScreenControllerProvider.notifier).setIsSelecting(value: true);
                },
                elevation: 2.0,
                fillColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.add, size: 50.0, color: Colors.white),
                shape: const CircleBorder(),
              )
            )
          ],
        )
      )
    );
  }
}