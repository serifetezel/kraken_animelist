import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime/data/model/list/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/anime_detail.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/card_image.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/card_title.dart';
import 'package:kraken_animelist/features/anime/presentation/widgets/score_episodes.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  const AnimeCard({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.calculateHeight(7),
      width: context.calculateWidth(1),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimeDetail(anime: anime),
            ),
          );
        },
        child: Card(
          elevation: 1.5,
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardImage(
                imageUrl: anime.images.jpg.imageUrl,
                malId: anime.malId,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardTitle(title: anime.title),
                      ScoreEpisodes(
                        score: anime.score,
                        episodes: anime.episodes,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
