import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/screens/main_screen/widgets/home_screen/widgets/item_list/item_list.dart';

enum PopupItems {
  account,
  logout,
}
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const ItemList();
  }
}