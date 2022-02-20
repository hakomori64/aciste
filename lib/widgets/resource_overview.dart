import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/models/message.dart';
import 'package:aciste/models/photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ResourceOverView extends StatelessWidget {
  final Item item;

  const ResourceOverView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item.resource == null) {
      return const Text("リソースが見つかりませんでした");
    }
    switch (item.resourceType!) {
      case ResourceType.photo:
        final photo = item.resource as Photo;
        return CachedNetworkImage(
          imageUrl: photo.url!,
          fit: BoxFit.fitWidth,
          placeholder: (_, __) => Container(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          )
        );
      case ResourceType.message:
        final message = item.resource as Message;
        return Center(
          child: Text(
            message.text!,
            style: const TextStyle(
              fontSize: 24,
            ),
          )
        );
      case ResourceType.none:
        return const Center(child: Text("Unknown type"));
    }
  }
}