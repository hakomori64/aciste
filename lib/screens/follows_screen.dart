import 'package:aciste/router.dart';
import 'package:aciste/screens/follows_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class FollowsScreen extends HookConsumerWidget {
  const FollowsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followsScreenState = ref.watch(followsScreenControllerProvider);

    return Scaffold(
      body: LazyLoadScrollView(
        isLoading: followsScreenState.isLoading,
        onEndOfPage: () => ref.read(followsScreenControllerProvider.notifier).loadMore(),
        child: ListView.builder(
          itemCount: followsScreenState.data.length,
          itemBuilder: (context, index) {
            final user = followsScreenState.data[index];
            return ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: user.id!));
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey[50],
                      child: CachedNetworkImage(
                        imageUrl: user.photoUrl,
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
              ),
              title: Text(user.displayName != '' ? user.displayName : 'ゲスト'),
            );
          },
        )
      )
    );
  }
}