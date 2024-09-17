import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final int malId;
  const CardImage({
    super.key,
    required this.imageUrl,
    required this.malId,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: malId,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: context.calculateWidth(5),
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
