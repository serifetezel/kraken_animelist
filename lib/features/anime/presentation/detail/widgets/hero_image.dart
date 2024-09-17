import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';

class HeroImage extends StatelessWidget {
  final int malId;
  final String imageUrl;
  const HeroImage({
    super.key,
    required this.malId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: malId,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 10),
        height: context.calculateHeight(4),
        width: context.calculateWidth(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
