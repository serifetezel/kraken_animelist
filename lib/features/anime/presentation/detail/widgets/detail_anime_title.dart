import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailAnimeTitle extends StatelessWidget {
  final String title;
  const DetailAnimeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
