import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/widgets/custom_photo_view/custom_photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class AttachmentView extends HookConsumerWidget {

  final Attachment attachment;

  const AttachmentView({Key? key, required this.attachment}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    switch (attachment.type) {
      case AttachmentType.photo:
        final photo = attachment.data! as Photo;
        return ClipRect(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CustomPhotoView(
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 1.8,
              initialScale: PhotoViewComputedScale.contained,
              backgroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5)
              ),
              imageProvider: CachedNetworkImageProvider(photo.url!),
            )
          )
        );
      case AttachmentType.none:
        return const Text('unrecognized type');
    }
  }
}