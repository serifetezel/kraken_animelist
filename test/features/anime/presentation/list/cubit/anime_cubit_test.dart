import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/features/anime/presentation/list/cubit/anime_cubit.dart';

void main() {
  blocTest<AnimeCubit, AnimeState>(
    '[AnimeCubit] method called [getAnimeList]',
    build: () => AnimeCubit(),
    act: (bloc) => bloc.getAnimeList(),
    expect: () => [isA<AnimeLoading>(), isA<AnimeLoaded>()],
  );
}
