import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/screens/main_screen/widgets/item_screen/widgets/item_list/item_list.dart';

enum PopupItems {
  account,
  logout,
}
class ItemScreen extends HookConsumerWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const ItemList();
  }
}