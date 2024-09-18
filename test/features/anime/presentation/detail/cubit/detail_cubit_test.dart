import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/cubit/detail_cubit.dart';

void main() {
  blocTest<DetailCubit, DetailState>(
    '[DetailCubit] method called [getCharacterList]',
    build: () => DetailCubit(),
    act: (bloc) => bloc.getCharacterList(1),
    expect: () => [isA<DetailLoading>(), isA<DetailLoaded>()],
  );
}
