import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime_detail/presentations/screens/anime.detail.dart';
import 'package:kraken_animelist/features/anime_list/presentation/cubit/anime_cubit.dart';

import '../../data/models/anime.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    context.read<AnimeCubit>().getAnimeList();
    scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      context.read<AnimeCubit>().getAnimeList();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        top: true,
        child: BlocConsumer<AnimeCubit, AnimeState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            if (state is AnimeInitial ||
                (state is AnimeLoading && state.isFirstFetch)) {
              return loadingIndicator();
            }

            List<Anime> animes = [];
            bool isLoading = false;
            bool isLastPage = false;

            if (state is AnimeLoading) {
              animes = state.oldAnimes;
              isLoading = true;
              isLastPage = state.isLastPage;
            } else if (state is AnimeLoaded) {
              animes = state.animes;
              isLastPage = state.isLastPage;
            }

            return ListView.builder(
              controller: scrollController,
              itemCount: animes.length + (isLoading || isLastPage ? 1 : 0),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index < animes.length) {
                  return animeCard(context, animes[index]);
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });

                  return isLastPage
                      ? allAnimesListed()
                      : const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                        );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Align allAnimesListed() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0.0, 1.0),
                blurRadius: 4.0,
              ),
            ],
            color: Colors.white,
            border: Border.all(width: .5, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: const Text('All animes are listed'),
      ),
    );
  }

  Center loadingIndicator() {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  SizedBox animeCard(BuildContext context, Anime anime) {
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
              buildCardImage(context, anime),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCardTitle(context, anime),
                      buildScoreEpisodes(anime),
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

  Padding buildScoreEpisodes(Anime anime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildScore(anime),
          Text(
            'Episodes: ${anime.episodes}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Row buildScore(Anime anime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '${anime.score} / 10',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  AutoSizeText buildCardTitle(BuildContext context, Anime anime) {
    return AutoSizeText(
      anime.title,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget buildCardImage(BuildContext context, Anime anime) {
    return Hero(
      tag: anime.malId,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: context.calculateWidth(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(anime.images.jpg.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.0,
      foregroundColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text('Kraken Anime List'),
    );
  }
}
