import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.url,
    required this.radius,
  });

  final String url;
  final double radius;

  const Avatar.small({
    super.key,
    required this.url,
  }) : radius = 16;

  const Avatar.medium({
    super.key,
    required this.url,
  }) : radius = 22;

  const Avatar.large({
    super.key,
    required this.url,
  }) : radius = 44;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}