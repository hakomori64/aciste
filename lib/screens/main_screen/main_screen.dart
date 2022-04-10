import 'package:aciste/constants.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/main_screen/controllers/main_screen_controller.dart';
import 'package:aciste/screens/main_screen/widgets/cmap_screen/cmap_screen.dart';
import 'package:aciste/screens/main_screen/widgets/item_screen/item_screen.dart';
import 'package:aciste/screens/main_screen/widgets/announcement_screen/announcement_screen.dart';
import 'package:aciste/screens/main_screen/widgets/main_floating_action_button/main_floating_action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainScreenControllerState = ref.watch(mainScreenControllerProvider);
    final userControllerState = ref.watch(userControllerProvider);

    final pageController = usePageController();

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
                    controller: pageController,
                    onPageChanged: ref.read(mainScreenControllerProvider.notifier).onPageChange,
                    children: const [
                      CMapScreen(),
                      ItemScreen(),
                      AnnouncementScreen(),
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
                        label: 'キャッシュ'
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.inventory),
                        label: 'インベントリ'
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.comment),
                        label: 'おしらせ'
                      )
                    ],
                    onTap: (int value) {
                      ref.read(mainScreenControllerProvider.notifier).jumpToPage(pageController, BottomItem.values[value]);
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
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: MainFloatingActionButton()
        )
      ),
    );
  }
}