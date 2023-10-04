import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;

  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      placeholder: (_, __) {
        return const AppCenterLoader();
      },
    );
  }
}
