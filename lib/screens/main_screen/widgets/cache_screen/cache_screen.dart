import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aciste/screens/main_screen/widgets/cache_screen/widgets/cache_list/cache_list.dart';

enum PopupItems {
  account,
  logout,
}
class CacheScreen extends HookConsumerWidget {
  const CacheScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const CacheList();
  }
}