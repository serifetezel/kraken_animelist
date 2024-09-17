import 'package:flutter/material.dart';
import 'package:kraken_animelist/features/anime/presentation/widgets/score.dart';

class ScoreEpisodes extends StatelessWidget {
  final int episodes;
  final double? score;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  const ScoreEpisodes({
    super.key,
    required this.episodes,
    this.score,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          score != null
              ? Score(
                  score: score,
                  textStyle: textStyle,
                )
              : const SizedBox(),
          Text(
            'Episodes: $episodes',
            style: textStyle ?? Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
