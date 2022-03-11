import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_item_list/widgets/profile_item_list_error/profile_item_list_error.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_item_list/widgets/profile_item_tile/profile_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileItemList extends HookConsumerWidget {
  const ProfileItemList({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final itemListState = ref.watch(itemListControllerProvider);
    final user = ref.watch(profileScreenControllerProvider).user;

    return itemListState.when(
      data: (items) {
        final filtered = items.where((item) => user?.id != null && item.resource?.createdBy?.id == user?.id).toList();
        return filtered.isEmpty ? const Center(
          child: Text('このユーザーのアイテムを持っていません')
        ) : Column(
          children: filtered.map((item) {
            return ProfileItemTile(item: item);
          }).toList());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ProfileItemListError(
        message: error is CustomException ? error.message! : 'ユーザーのアイテムの取得に失敗しました',
      )
    );
  }
}