import 'package:aciste/router.dart';
import 'package:aciste/screens/item_detail_screen/item_detail_screen_controller.dart';
import 'package:aciste/widgets/resource_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemDetailScreen extends HookConsumerWidget {

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemDetailScreenState = ref.watch(itemDetailScreenControllerProvider);
    if (itemDetailScreenState.item == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(itemDetailScreenState.item!.name),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => ref.read(routerProvider.notifier).pop(),
        ),
      ),
      body: ClipRRect(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,

          child:ResourceView(item: itemDetailScreenState.item!),
        ),
      ),
    );
  }
}