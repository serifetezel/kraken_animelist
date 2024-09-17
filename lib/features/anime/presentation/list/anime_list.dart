import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/features/anime/data/model/list/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/list/cubit/anime_cubit.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/all_animes_listed.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/anime_card.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/list_app_bar.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/list_view_skeleton.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/pagination_loading.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  late MethodChannel channel;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    channel = const MethodChannel('com.example/anime');

    channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'fetchAnimeList') {
        fetchAnimeList();
      }
    });

    callNativeFetchAnimeList();
    scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      callNativeFetchAnimeList();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void callNativeFetchAnimeList() async {
    channel.invokeMethod('fetchAnimeList');
  }

  void fetchAnimeList() {
    context.read<AnimeCubit>().getAnimeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ListAppBar(),
      body: SafeArea(
        top: true,
        child: BlocConsumer<AnimeCubit, AnimeState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            if (state is AnimeInitial ||
                (state is AnimeLoading && state.isFirstFetch)) {
              return ListViewSkeleton(scrollController: scrollController);
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
                  return AnimeCard(anime: animes[index]);
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });

                  return isLastPage
                      ? const AllAnimesListed()
                      : const PaginationLoading();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
