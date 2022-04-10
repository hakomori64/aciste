import 'package:aciste/models/cmap.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CMapTile extends HookConsumerWidget {
  final CMap cMap;

  const CMapTile({Key? key, required this.cMap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Card();
  }
}