import 'dart:math';

import 'package:aciste/constants.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_edit_screen.dart';
import 'package:aciste/widgets/resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'item_tile/options_bottom_sheet.dart';

class ItemTile extends HookConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    ) * 3 / 4;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey[50],
                  child: Image.network(item.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl),
                )
              ),
            ),
            title: Center(child: Text(item.name)),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description)
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () async {
                await showOptionsBottomSheet(
                  context: context,
                  item: item,
                  onEdit: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) => ItemEditScreen(item: item)
                    );
                  },
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
                  onShare: () async {
                    final resourceId = item.resource!.id!;
                    final url = await ref.read(dynamicLinksControllerProvider).getItemImportUrl(resourceId: resourceId);
                    final data = ClipboardData(text: url);
                    await Clipboard.setData(data);
                  }
                );
              },
            ),
          ),
          Container(
            width: boxSize,
            height: boxSize,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.itemDetail.route, extra: item);
                },
                child: ResourceOverView(item: item),
              )
            ),
          )
        ],
      ),
    );
  }
}