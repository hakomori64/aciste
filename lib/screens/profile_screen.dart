import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/qrcode_screen.dart';
import 'package:aciste/screens/qrcode_screen/qrcode_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/screens/profile_screen/profile_screen_controller.dart';
import 'package:share/share.dart';

enum PopupItems {
  editProfile,
  share,
}

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileScreenControllerProvider).user;
    final me = ref.watch(authControllerProvider);

    if (user == null || me == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: user.backgroundImageUrl,
              imageBuilder: (context, imageProvider) => Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Container(
                        alignment: const Alignment(0, 2.5),
                        child: ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColorLight,
                            child: CachedNetworkImage(
                              imageUrl: user.photoUrl,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            )
                          )
                        )
                      )
                    ),
                  ),
                  if (user.id == me.uid) Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 20,
                        right: 20,
                      ),
                      child: PopupMenuButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0)
                          )
                        ),
                        onSelected: (PopupItems item) async {
                          switch (item) {
                            case PopupItems.editProfile:
                              ref.read(routerProvider.notifier).push(route: Routes.profileEdit);
                              break;
                            case PopupItems.share:
                              ref.read(routerProvider.notifier).showBottomSheet(child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.share),
                                    title: const Text('共有'),
                                    onTap: () async {
                                      ref.read(routerProvider.notifier).closeBottomSheet();
                                      final userId = user.id!;
                                      final url = await ref.read(dynamicLinksControllerProvider.notifier).getProfileUrl(userId: userId);
                                      final box = context.findRenderObject() as RenderBox?;
                                      final userName = user.displayName != '' ? user.displayName : 'ゲスト';
                                      await Share.share("$userNameさんをチェックしよう\n$url", subject: url, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                                    }
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.qr_code),
                                    title: const Text('QRコードで共有'),
                                    onTap: () async {
                                      ref.read(routerProvider.notifier).closeBottomSheet();
                                      final userId = user.id!;
                                      final url = await ref.read(dynamicLinksControllerProvider.notifier).getProfileUrl(userId: userId);
                                      ref.read(qrCodeScreenControllerProvider.notifier).setUrl(url);
                                      ref.read(routerProvider.notifier).showDialog(
                                        child: const QRCodeScreen(),
                                      );
                                    },
                                  )
                                ],
                              ));
                              break;
                          }
                        },
                        child: const Icon(Icons.more_vert),
                        itemBuilder: (context) => <PopupMenuEntry<PopupItems>>[
                          const PopupMenuItem(
                            value: PopupItems.editProfile,
                            child: Text('プロフィールを編集'),
                          ),
                          const PopupMenuDivider(),
                          const PopupMenuItem(
                            value: PopupItems.share,
                            child: Text('共有')
                          )
                        ],
                      )
                    )
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              user.displayName,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black54,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              )
            ),
            if (user.id != me.uid) Padding(
              padding: const EdgeInsets.all(10),
              child: (user.followedBy.contains(me.uid)) ?
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )
                    )
                  ),
                  onPressed: () async {
                    await ref.read(userControllerProvider.notifier).unfollow(fromId: me.uid, toId: user.id!);
                    await ref.read(profileScreenControllerProvider.notifier).setUser(userId: user.id!);
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        'フォロー解除',
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    )
                  )
                ) :
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )
                    )
                  ),
                  onPressed: () async {
                    await ref.read(userControllerProvider.notifier).follow(fromId: me.uid, toId: user.id!);
                    await ref.read(profileScreenControllerProvider.notifier).setUser(userId: user.id!);
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        'フォロー',
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    )
                  )
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(routerProvider.notifier).push(route: Routes.follows, extra: FollowsRouteParams(follows: user.following));
                      },
                      child: Column(
                        children: [
                          Text("フォロー数",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                          const SizedBox(
                            height: 5
                          ),
                          Text(
                            "${user.following.length} 人",
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(routerProvider.notifier).push(route: Routes.follows, extra: FollowsRouteParams(follows: user.following));
                      },
                      child: Column(
                        children: [
                          Text("フォロワー数",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                          const SizedBox(
                            height: 5
                          ),
                          Text(
                            "${user.followedBy.length} 人",
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    user.bio,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}