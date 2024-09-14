import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime_detail/presentations/screens/anime.detail.dart';

import '../../data/models/anime.dart';
import '../../data/services/api_service.dart';
import 'package:chopper/chopper.dart' as Chopper;

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  ApiService? service;

  List<Anime> animeList = <Anime>[];

  @override
  void initState() {
    service = ApiService.create();

    super.initState();
  }

  @override
  didChangeDependencies() async {
    super.didChangeDependencies();
    animeList = await getAnimeList();
    setState(() {});
  }

  Future<List<Anime>> getAnimeList() async {
    final Chopper.Response animeResponse = await service!.getAnimeList(1, 20);

    if (animeResponse.isSuccessful) {
      final animeObjectList = animeResponse.body['data'] as List;
      final animes = animeObjectList
          .map((singleJsonObject) => Anime.fromJson(singleJsonObject))
          .toList();
      return animes;
    } else {
      return <Anime>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        top: true,
        child: ListView.builder(
          itemCount: animeList.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return animeCard(context, index);
          },
        ),
      ),
    );
  }

  SizedBox animeCard(BuildContext context, int index) {
    return SizedBox(
      height: context.calculateHeight(7),
      width: context.calculateWidth(1),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimeDetail(
                  id: animeList[index].malId,
                  imageUrl: animeList[index].images.jpg.largeImageUrl,
                  title: animeList[index].title,
                  ratingScore: animeList[index].score,
                  genres: animeList[index].genres,
                  synopsis: animeList[index].synopsis,
                  episodesCount: animeList[index].episodes),
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
              buildCardImage(context, index),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCardTitle(index, context),
                      buildScoreEpisodes(index),
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

  Padding buildScoreEpisodes(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildScore(index),
          Text(
            'Episodes: ${animeList[index].episodes}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Row buildScore(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '${animeList[index].score} / 10',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  AutoSizeText buildCardTitle(int index, BuildContext context) {
    return AutoSizeText(
      animeList[index].title,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget buildCardImage(BuildContext context, int index) {
    return Hero(
      tag: animeList[index].malId,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: context.calculateWidth(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                animeList[index].images.jpg.imageUrl),
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
