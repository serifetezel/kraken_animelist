import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/services/api_service.dart';

import '../../data/models/anime.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final chopper = ApiService.create();
  AnimeCubit() : super(AnimeInitial());

  int page = 1;

  void getAnimeList() async {
    if (state is AnimeLoading) return;
    List<Anime> newAnimes;
    bool isLastPage = false;

    final currentState = state;

    var oldAnimes = <Anime>[];
    if (currentState is AnimeLoaded) {
      oldAnimes = currentState.animes;
      if (currentState.isLastPage) {
        return;
      }
    }

    emit(AnimeLoading(oldAnimes,
        isFirstFetch: page == 1, isLastPage: isLastPage));

    var response = await chopper.getAnimeList(page);
    if (response.isSuccessful && response.body['data'] != null) {
      int lastVisiblePage =
          response.body['pagination']['last_visible_page'] ?? 0;
      if (page > lastVisiblePage) {
        isLastPage = true;
      }
      page++;
      final animeObjectList = response.body['data'] as List;
      newAnimes = animeObjectList
          .map((singleJsonObject) => Anime.fromJson(singleJsonObject))
          .toList();
    } else {
      newAnimes = <Anime>[];
    }

    final animes = (state as AnimeLoading).oldAnimes;
    animes.addAll(newAnimes);

    emit(AnimeLoaded(animes, isLastPage: isLastPage));
  }
}
