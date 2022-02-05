import 'package:aciste/constants.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/router.dart';
import 'package:aciste/widgets/resource_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'item_tile/options_bottom_sheet.dart';

class ItemTile extends HookConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.itemDetail.route, extra: item);
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              leading: ClipOval(
                child: SizedBox(
                  height: 40,
                  child: Image.network(item.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl),
                )
              ),
              title: Text(item.name),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () async {
                  await showOptionsBottomSheet(
                    context: context,
                    item: item,
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('${item.name}の削除'),
                          content: const Text('本当に削除しますか?'),
                          actions: [
                            TextButton(
                              child: const Text('キャンセル'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('削除'),
                              onPressed: () async {
                                await ref.read(itemListControllerProvider.notifier)
                                  .deleteItem(itemId: item.id!);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      );
                    },
                    onShare: () {
                      debugPrint('share');
                    }
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ResourceView(item: item),
            ),
          ],
        ),
      )
    );
  }
}