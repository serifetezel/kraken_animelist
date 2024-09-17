import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
