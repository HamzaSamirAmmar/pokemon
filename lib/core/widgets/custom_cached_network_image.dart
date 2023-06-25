import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      alignment: Alignment.center,
      placeholder: (context, url) => const Loader(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
