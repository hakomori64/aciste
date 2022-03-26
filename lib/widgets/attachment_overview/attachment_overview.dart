import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttachmentOverview extends HookConsumerWidget {
  const AttachmentOverview({ Key? key, required this.attachment, required this.fit }) : super(key: key);
  final AsyncValue<Attachment> attachment;
  final BoxFit fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return attachment.when(
      data: (data) {
        return GestureDetector(
          child: (() {
            switch (data.type) {
              case AttachmentType.photo:
                final photo = data.data as Photo;
                return CachedNetworkImage(imageUrl: photo.url!, fit: BoxFit.cover);
              default:
                return const Text('unrecognized type');
            }
          })(),
          onTap: () {},
        );
      },
      error: (_, __) {
        return const Text('エラーが発生しました');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator()
        );
      } 
    );
  }
}