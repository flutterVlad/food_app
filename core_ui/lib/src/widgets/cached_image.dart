import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;

  const CachedImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (BuildContext context, String url) {
        return const AppCenterLoader();
      },
    );
  }
}
