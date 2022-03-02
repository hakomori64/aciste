import 'package:aciste/constants.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/message.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/main_screen/main_screen_controller.dart';
import 'package:aciste/screens/main_screen/widgets/home_screen.dart';
import 'package:aciste/screens/main_screen/widgets/notification_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainScreenControllerState = ref.watch(mainScreenControllerProvider);
    final userControllerState = ref.watch(userControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        if (mainScreenControllerState.isSelecting) {
          ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: false);
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(100.0),
                  child: AppBar(
                    centerTitle: true,
                    backgroundColor: Theme.of(context).primaryColor,
                    title: const Text('Aciste'),
                    leading: userControllerState.when(
                      data: (user) => Container(
                        padding: const EdgeInsets.all(10),
                        child: ClipOval(
                          child: PopupMenuButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0)
                              )
                            ),
                            onSelected: (PopupItems item) async {
                              switch (item) {
                                case PopupItems.account:
                                  ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: user!.id!));
                                  break;
                                case PopupItems.logout:
                                  ref.read(authControllerProvider.notifier).signOut();
                                  await ref.read(routerProvider.notifier).rebirth();
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: user?.photoUrl ?? defaultUserPhotoUrl,
                                fit: BoxFit.cover,
                              )
                            ),
                            itemBuilder: (context) => <PopupMenuEntry<PopupItems>>[
                              const PopupMenuItem(
                                value: PopupItems.account,
                                child: Text('アカウント')
                              ),
                              const PopupMenuDivider(),
                              const PopupMenuItem(
                                value: PopupItems.logout,
                                child: Text('ログアウト')
                              )
                            ],
                          )
                        ),
                      ),
                      loading: () => const SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
                      error: (error, _) => Text(error is CustomException ? error.message! : 'Something went wrong'),
                    )
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: ref.watch(mainScreenControllerProvider.notifier).pageController,
                    onPageChanged: ref.read(mainScreenControllerProvider.notifier).onPageChange,
                    children: const [
                      HomeScreen(),
                      NotificationScreen(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: BottomNavigationBar(
                    currentIndex: mainScreenControllerState.page.index,
                    items: const [
                      BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage('assets/images/logo.png')),
                        label: 'アイテム'
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: '通知'
                      )
                    ],
                    onTap: (int value) {
                      ref.read(mainScreenControllerProvider.notifier).jumpToPage(BottomItem.values[value]);
                    },
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            if (mainScreenControllerState.isSelecting) Material(
              type: MaterialType.transparency,
              child: GestureDetector(
                onTap: () => ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: false),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ),
          ],
        ),
        floatingActionButton: mainScreenControllerState.page == BottomItem.home ? Padding(
          padding: const EdgeInsets.only(bottom: 60),
        child: mainScreenControllerState.isSelecting
          ? Column(
            verticalDirection: VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: RawMaterialButton(
                  onPressed: () async {
                    ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: false);
                    await ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(resourceType: ResourceType.photo, onTapFunc: (file) async {
                      ref.read(routerProvider.notifier).push(route: Routes.itemCreate, extra: ItemCreateRouteParams(resourceType: ResourceType.photo, params: CreatePhotoParams(file: file)));
                    }));
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.photo, size: 40.0, color: Colors.white),
                  ),
                  shape: const CircleBorder(),
                )
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: RawMaterialButton(
                  onPressed: () async {
                    ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: false);
                    await ref.read(routerProvider.notifier).push(route: Routes.message, extra: MessageRouteParams(resourceType: ResourceType.message, onTapFunc: (message) async {
                      ref.read(routerProvider.notifier).push(route: Routes.itemCreate, extra: ItemCreateRouteParams(resourceType: ResourceType.message, params: CreateMessageParams(message: message)));
                    }));
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.message, size: 40.0, color: Colors.white),
                  ),
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
                    ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: true);
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.add, size: 40.0, color: Colors.white),
                  ),
                  shape: const CircleBorder(),
                )
              )
            ],
          )
        ) : null
      ),
    );
  }
}