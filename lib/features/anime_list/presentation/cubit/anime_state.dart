part of 'anime_cubit.dart';

abstract class AnimeState {
  const AnimeState();
}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {
  final List<Anime> oldAnimes;
  final bool isFirstFetch;
  final bool isLastPage;
  AnimeLoading(this.oldAnimes,
      {this.isFirstFetch = false, this.isLastPage = false});
}

class AnimeLoaded extends AnimeState {
  final List<Anime> animes;
  final bool isLastPage;
  AnimeLoaded(this.animes, {this.isLastPage = false});
}
