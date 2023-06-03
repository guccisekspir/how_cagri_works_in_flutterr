import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class MNetworkImage extends StatelessWidget {
  const MNetworkImage(
      {super.key,
      required this.imageURL,
      this.boxFit = BoxFit.fill,
      this.isCached = true});
  final String imageURL;

  final BoxFit boxFit;
  final bool isCached;

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: CachedNetworkImageProvider(imageURL),
      placeholderBuilder: OctoPlaceholder.blurHash(
        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
      ),
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: boxFit,
    );
  }
}
