import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/features/anime/data/model/detail/character.dart';
import 'package:kraken_animelist/features/anime/data/model/detail/image_format.dart';
import 'package:kraken_animelist/features/anime/data/model/detail/images.dart';
import 'package:kraken_animelist/features/anime/data/model/list/anime.dart';
import 'package:kraken_animelist/features/anime/data/model/list/image_detail.dart';
import 'package:kraken_animelist/features/anime/data/model/list/images.dart'
    as animeImage;
import 'package:kraken_animelist/features/anime/presentation/detail/anime_detail.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/character_item.dart';
import 'package:kraken_animelist/features/anime/presentation/detail/widgets/grid_view_skeleton.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:kraken_animelist/features/anime/presentation/detail/cubit/detail_cubit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockDetailCubit extends MockCubit<DetailState> implements DetailCubit {}

class MockDetailState extends Fake implements DetailState {}

void main() {
  late MockDetailCubit detailCubit;
  late Anime anime;
  late List<Character> mockCharacters;

  setUpAll(() {
    detailCubit = MockDetailCubit();
    mocktail.registerFallbackValue(MockDetailState());
    HttpOverrides.global = null;
    anime = Anime(
      malId: 1,
      images: animeImage.Images(
        jpg: ImageDetail(
          imageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006.jpg",
          smallImageUrl:
              "https://cdn.myanimelist.net/images/anime/1015/138006t.jpg",
          largeImageUrl:
              "https://cdn.myanimelist.net/images/anime/1015/138006l.jpg",
        ),
        webp: ImageDetail(
          imageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006.webp",
          smallImageUrl:
              "https://cdn.myanimelist.net/images/anime/1015/138006t.webp",
          largeImageUrl:
              "https://cdn.myanimelist.net/images/anime/1015/138006l.webp",
        ),
      ),
      title: 'Sousou no Frieren',
      episodes: 1,
      score: 9.9,
      synopsis:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      genres: [],
    );

    mockCharacters = List.generate(
      20,
      (index) => Character(
          malId: 1,
          url: "https://myanimelist.net/character/12/Alphonse_Elric",
          images: Images(
              jpg: ImageFormat(
                  imageUrl:
                      "https://cdn.myanimelist.net/images/characters/5/54265.jpg?s=65c1a674adae3d7c5740d5711517285a"),
              webp: ImageFormat(
                  imageUrl:
                      "https://cdn.myanimelist.net/images/characters/5/54265.webp?s=65c1a674adae3d7c5740d5711517285a",
                  smallImageUrl:
                      "https://cdn.myanimelist.net/images/characters/5/54265t.webp?s=65c1a674adae3d7c5740d5711517285a")),
          name: "Elric, Alphonse $index"),
    );
  });

  group('Anime Detail Tests', () {
    group('[DetailInitial] state tests', () {
      testWidgets('Anime information section tests',
          (WidgetTester tester) async {
        mocktail.when(() => detailCubit.state).thenReturn(DetailInitial());
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<DetailCubit>(
                create: (BuildContext ctx) => detailCubit,
              ),
            ],
            child: MaterialApp(
              home: AnimeDetail(
                anime: anime,
              ),
            ),
          ),
        );

        expect(
          find.text('Sousou no Frieren'),
          findsOneWidget,
        );

        expect(
          find.textContaining('Lorem ipsum dolor sit amet'),
          findsOneWidget,
        );

        expect(
          find.text('Show More'),
          findsOneWidget,
        );
      });

      testWidgets(
          'Is [GridViewSkeleton] coming in [DetailInitial] state? Are at least 10 [SkeletonAvatars] loaded?',
          (WidgetTester tester) async {
        mocktail.when(() => detailCubit.state).thenReturn(DetailInitial());
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<DetailCubit>(
                create: (BuildContext ctx) => detailCubit,
              ),
            ],
            child: MaterialApp(
              home: AnimeDetail(anime: anime),
            ),
          ),
        );

        expect(find.byType(GridViewSkeleton), findsOneWidget);

        expect(find.byType(SkeletonAvatar), findsAtLeastNWidgets(3));
      });
    });

    group('[DetailLoading] state tests', () {
      testWidgets('Anime information section tests',
          (WidgetTester tester) async {
        mocktail.when(() => detailCubit.state).thenReturn(DetailLoading());
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<DetailCubit>(
                create: (BuildContext ctx) => detailCubit,
              ),
            ],
            child: MaterialApp(
              home: AnimeDetail(
                anime: anime,
              ),
            ),
          ),
        );

        expect(
          find.text('Sousou no Frieren'),
          findsOneWidget,
        );

        expect(
          find.textContaining('Lorem ipsum dolor sit amet'),
          findsOneWidget,
        );

        expect(
          find.text('Show More'),
          findsOneWidget,
        );
      });

      testWidgets(
          'Is [GridViewSkeleton] coming in [DetailLoading]? Are at least 10 [SkeletonAvatars] loaded?',
          (WidgetTester tester) async {
        mocktail.when(() => detailCubit.state).thenReturn(DetailLoading());
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<DetailCubit>(
                create: (BuildContext ctx) => detailCubit,
              ),
            ],
            child: MaterialApp(
              home: AnimeDetail(anime: anime),
            ),
          ),
        );

        expect(find.byType(GridViewSkeleton), findsOneWidget);

        expect(find.byType(SkeletonAvatar), findsAtLeastNWidgets(3));
      });
    });

    group('[DetailLoaded] state tests', () {
      testWidgets(
          'Are there at least 5 [CharacterItems] in the [DetailLoaded] state? Is there an [Elric, Alphonse 0] element in the list?',
          (WidgetTester tester) async {
        mocktail
            .when(() => detailCubit.state)
            .thenReturn(DetailLoaded(mockCharacters));

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<DetailCubit>(
                  create: (BuildContext ctx) => detailCubit,
                ),
              ],
              child: MaterialApp(
                home: AnimeDetail(anime: anime),
              ),
            ),
          ),
        );

        expect(find.byType(CharacterItem), findsAtLeastNWidgets(3));

        expect(find.text('Elric, Alphonse 0'), findsOneWidget);
      });

      testWidgets(
          'Is it possible to scroll a GridView in the [DetailLoaded] state?',
          (WidgetTester tester) async {
        mocktail
            .when(() => detailCubit.state)
            .thenReturn(DetailLoaded(mockCharacters));

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<DetailCubit>(
                  create: (BuildContext ctx) => detailCubit,
                ),
              ],
              child: MaterialApp(
                home: AnimeDetail(
                  anime: anime,
                ),
              ),
            ),
          ),
        );

        // Ekranda "Elric, Alphonse 0" elemanını buluyoruz
        expect(find.text('Elric, Alphonse 0'), findsOneWidget);

        //GridView componentini scroll yapıyoruz
        await tester.fling(find.byType(GridView), const Offset(0, -400), 3000);

        // Ekranda artık Sayı 0 'ın olmadığına emin oluyoruz.
        expect(find.text('Elric, Alphonse 0'), findsNothing);
      });
    });
  });
}
