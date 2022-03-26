import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CustomPhotoView extends StatefulWidget {
  const CustomPhotoView({
    Key? key,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.backgroundDecoration,
    this.imageProvider,
  }) : super(key: key);
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final BoxDecoration? backgroundDecoration;
  final ImageProvider? imageProvider;

  @override
  State<CustomPhotoView> createState() => _CustomPhotoViewState();
}

class _CustomPhotoViewState extends State<CustomPhotoView> {

  late PhotoViewControllerBase controller;

  @override
  void initState() {
    controller = PhotoViewController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      controller: controller,
      minScale: widget.minScale,
      maxScale: widget.maxScale,
      initialScale: widget.initialScale,
      backgroundDecoration: widget.backgroundDecoration,
      imageProvider: widget.imageProvider,
    );
  }
}