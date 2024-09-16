import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime_detail/presentations/cubit/detail_cubit.dart';

import '../../../anime_list/data/models/anime.dart';
import '../../../anime_list/data/models/genre.dart';

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
  int maxLines = 3;

  @override
  void initState() {
    context.read<DetailCubit>().getCharacterList(widget.anime.malId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImage(widget.anime),
                buildTitle(widget.anime),
                buildScoreEpisodes(widget.anime),
                buildGenres(widget.anime.genres),
                buildSynopsis(widget.anime.synopsis),
                buildCharcterList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(Anime anime) {
    String imageUrl = anime.images.jpg.largeImageUrl != null
        ? anime.images.jpg.largeImageUrl!
        : anime.images.jpg.imageUrl;
    return Hero(
      tag: anime.malId,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 10),
        height: context.calculateHeight(4),
        width: context.calculateWidth(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AutoSizeText buildTitle(Anime anime) {
    return AutoSizeText(
      anime.title,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget buildScoreEpisodes(Anime anime) {
    return anime.score == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildScore(anime.score!),
                Text(
                  'Episodes: ${anime.episodes}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
  }

  Row buildScore(double score) {
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
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  Widget buildGenres(List<Genre> genres) {
    return SizedBox(
      width: context.calculateWidth(1),
      height: context.calculateHeight(16),
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                padding: const EdgeInsets.all(5),
                child: Text(genres[index].name),
              );
            }),
      ),
    );
  }

  Widget buildSynopsis(String synopsis) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Text(
            synopsis,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          synopsis.isEmpty
              ? const SizedBox()
              : InkWell(
                  child: Text(
                    maxLines == 3 ? 'Show More...' : 'Show Less...',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  onTap: () {
                    setState(() {
                      maxLines = maxLines == 3 ? 100 : 3;
                    });
                  },
                ),
        ],
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
                return const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: CachedNetworkImageProvider(
                            state.characterList[index].images.jpg.imageUrl,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        AutoSizeText(
                          state.characterList[index].name,
                          maxFontSize: 15,
                          textAlign: TextAlign.center,
                          minFontSize: 10,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    );
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
