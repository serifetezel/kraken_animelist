import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime/data/model/list/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/cubit/detail_cubit.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/character_item.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/detail_anime_title.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/detail_app_bar.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/genre_list.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/grid_view_skeleton.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/hero_image.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/synopsis.dart';
import 'package:kraken_animelist/features/anime/presentation/widgets/score_episodes.dart';

class AnimeDetail extends StatefulWidget {
  final Anime anime;
  const AnimeDetail({
    super.key,
    required this.anime,
  });

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  late String imageUrl;

  @override
  void initState() {
    context.read<DetailCubit>().getCharacterList(widget.anime.malId);
    imageUrl = widget.anime.images.jpg.largeImageUrl != null
        ? widget.anime.images.jpg.largeImageUrl!
        : widget.anime.images.jpg.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DetailAppBar(),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeroImage(malId: widget.anime.malId, imageUrl: imageUrl),
                DetailAnimeTitle(title: widget.anime.title),
                ScoreEpisodes(
                  episodes: widget.anime.episodes,
                  score: widget.anime.score,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                GenreList(genres: widget.anime.genres),
                Synopsis(synopsis: widget.anime.synopsis),
                buildCharcterList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCharcterList() {
    return Column(
      children: [
        const Divider(
          color: Colors.blueGrey,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Characters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: context.calculateHeight(2),
          width: context.calculateWidth(1),
          child: BlocConsumer<DetailCubit, DetailState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              if (state is DetailInitial || state is DetailLoading) {
                return const GridViewSkeleton();
              } else if (state is DetailLoaded) {
                return GridView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: state.characterList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CharacterItem(character: state.characterList[index]);
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
