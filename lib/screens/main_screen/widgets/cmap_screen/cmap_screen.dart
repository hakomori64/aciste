import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cmap_list/cmap_list.dart';

class CMapScreen extends HookConsumerWidget {
  const CMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return const CMapList();
  }
}