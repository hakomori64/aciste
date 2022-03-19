import 'package:aciste/router.dart';
import 'package:aciste/screens/follows_screen/controllers/follows_screen_controller.dart';
import 'package:aciste/widgets/user_icon/user_icon.dart';
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
            leading: UserIcon(
              imageUrl: user.photoUrl,
              size: 40,
              onTap: () async {
                ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: user.id!));
              },
            ),
            title: Text(user.displayName != '' ? user.displayName : 'ゲスト'),
          );
        },
      )
    );
  }
}