import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final double? score;
  final TextStyle? textStyle;
  const Score({
    super.key,
    this.score,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '$score / 10',
          style: textStyle ?? Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
