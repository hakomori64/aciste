import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar_view/widgets/profile_item_list/controllers/profile_item_list_controller.dart';
import './widgets/profile_item_tile/profile_item_tile.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileItemList extends HookConsumerWidget {
  const ProfileItemList({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final itemListState = ref.watch(profileItemListControllerProvider);

    return itemListState.data.when(
      data: (items) => items.isEmpty ? const SliverToBoxAdapter(
        child: Center(
          child: Text('あなたはまだこのユーザーのアイテムを持っていません')
        ),
      ) : SliverList(
        delegate: SliverChildListDelegate(
          items.map((item) {
            return ProfileItemTile(item: item);
          }).toList()
        ),
      ),
      loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
      error: (error, _) => SliverToBoxAdapter(
        child: SomethingWentWrong(
          message: error is CustomException ? error.message! : 'ユーザーのアイテムの取得に失敗しました',
        ),
      )
    );
  }
}