import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ResourceView extends HookConsumerWidget {

  final Item item;

  const ResourceView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    switch (item.resource!.type) {
      case ResourceType.photo:
        return PhotoView(
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
          initialScale: PhotoViewComputedScale.contained,
          backgroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          imageProvider: CachedNetworkImageProvider(item.resource!.url),
        );
      case ResourceType.none:
        return const Text('unrecognized type');
    }
  }
}