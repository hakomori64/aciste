import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';

Future<void> showOptionsBottomSheet({required BuildContext context, required Item item, required Function() onDelete, required Function() onShare}) async {
  await showModalBottomSheet(context: context, builder: (builder) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('削除'),
          onTap: onDelete,
        ),
        if (item.userId == item.resource!.createdBy!.id) ListTile(
          leading: const Icon(Icons.share),
          title: const Text('共有'),
          onTap: onShare,
        )
      ],
    );
  });
}