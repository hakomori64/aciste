import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key? key,
    required this.size,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final double size;
  final String imageUrl;
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: GestureDetector(
          onTap: onTap ?? () {},
          child: Container(
            width: size,
            height: size,
            color: Colors.grey[50],
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            )
          )
        )
      ),
    );
  }
}