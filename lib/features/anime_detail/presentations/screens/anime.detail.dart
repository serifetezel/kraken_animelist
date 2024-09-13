import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';

class AnimeDetail extends StatefulWidget {
  final int id;
  final String? imageUrl;
  final String? title;
  final double? ratingScore;
  final List? genres;
  final String? synopsis;
  final int? episodesCount;
  const AnimeDetail(
      {super.key,
      required this.id,
      this.imageUrl,
      this.title,
      this.ratingScore,
      this.genres,
      this.synopsis,
      this.episodesCount});

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  int maxLines = 3;
  late String limitedSynopsis;
  @override
  void initState() {
    limitedSynopsis =
        widget.synopsis != null ? widget.synopsis!.substring(0, 200) : '';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImage(),
                buildTitle(),
                buildScoreEpisodes(),
                buildGenres(),
                buildSynopsis(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGenres() {
    return SizedBox(
      width: context.calculateWidth(1),
      height: context.calculateHeight(16),
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.genres?.length,
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
                child: Text(widget.genres?[index]['name']),
              );
            }),
      ),
    );
  }

  Widget buildSynopsis() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Text(
            widget.synopsis!,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          InkWell(
            child: Text(
              maxLines == 3 ? 'Show More...' : 'Show Less...',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              setState(() {
                maxLines = maxLines == 3 ? 100 : 3;
              });
            },
          )
        ],
      ),
    );
  }

  Padding buildScoreEpisodes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildScore(),
          Text(
            'Episodes: ${widget.episodesCount}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Hero(
      tag: widget.id,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 10),
        height: context.calculateHeight(4),
        width: context.calculateWidth(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
          image: DecorationImage(
            image: CachedNetworkImageProvider(widget.imageUrl!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AutoSizeText buildTitle() {
    return AutoSizeText(
      widget.title ?? '',
      maxLines: 2,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Row buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '${widget.ratingScore} / 10',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
