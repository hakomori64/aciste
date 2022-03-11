import 'package:aciste/router.dart';
import 'package:aciste/screens/follows_screen/controllers/follows_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowsScreen extends HookConsumerWidget {
  const FollowsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followsScreenState = ref.watch(followsScreenControllerProvider);
    final isLoading = followsScreenState.isLoading;
    final data = followsScreenState.data;

    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() => ref.read(followsScreenControllerProvider.notifier).onScroll(scrollController));

      return;
    }, []);

    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: isLoading ? data.length + 1 : data.length,
        itemBuilder: (context, index) {
          if (index == data.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

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
    );
  }
}