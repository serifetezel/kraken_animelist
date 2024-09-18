import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/features/anime/data/model/list/anime.dart';
import 'package:kraken_animelist/features/anime/data/model/list/image_detail.dart';
import 'package:kraken_animelist/features/anime/data/model/list/images.dart';
import 'package:kraken_animelist/features/anime/presentation/list/anime_list.dart';
import 'package:kraken_animelist/features/anime/presentation/list/cubit/anime_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/all_animes_listed.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/anime_card.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/list_view_skeleton.dart';
import 'package:kraken_animelist/features/anime/presentation/list/widgets/pagination_loading.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockAnimeCubit extends MockCubit<AnimeState> implements AnimeCubit {}

class MockAnimeState extends Fake implements AnimeState {}

void main() {
  late MockAnimeCubit animeCubit;
  late List<Anime> mockAnimes;

  setUpAll(() {
    animeCubit = MockAnimeCubit();
    mocktail.registerFallbackValue(MockAnimeState());
    HttpOverrides.global = null;

    mockAnimes = List.generate(
      20,
      (index) => Anime(
        malId: 1,
        images: Images(
          jpg: ImageDetail(
            imageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006.jpg",
            smallImageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006t.jpg",
            largeImageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006l.jpg",
          ),
          webp: ImageDetail(
            imageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006.webp",
            smallImageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006t.webp",
            largeImageUrl:
                "https://cdn.myanimelist.net/images/anime/1015/138006l.webp",
          ),
        ),
        title: 'Sousou no Frieren $index',
        episodes: 1,
        score: 9.9,
        synopsis:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        genres: [],
      ),
    );
  });

  group('Anime List Tests', () {
    group('[AnimeInitial] status tests', () {
      testWidgets(
          'Is [ListViewSkeleton] coming in [AnimeInitial] status? Are at least 10 [SkeletonAvatars] loaded?',
          (WidgetTester tester) async {
        mocktail.when(() => animeCubit.state).thenReturn(AnimeInitial());
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<AnimeCubit>(
                create: (BuildContext ctx) => animeCubit,
              ),
            ],
            child: const MaterialApp(
              home: AnimeList(),
            ),
          ),
        );

        expect(find.byType(ListViewSkeleton), findsOneWidget);

        expect(find.byType(SkeletonAvatar), findsNWidgets(10));
      });
    });

    group('[AnimeLoading] state tests', () {
      testWidgets(
          'In [AnimeLoading] state and isFirstFetch, is [ListViewSkeleton] coming? Are at least 10 [SkeletonAvatars] loaded?',
          (WidgetTester tester) async {
        mocktail
            .when(() => animeCubit.state)
            .thenReturn(AnimeLoading([], isFirstFetch: true));
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<AnimeCubit>(
                create: (BuildContext ctx) => animeCubit,
              ),
            ],
            child: const MaterialApp(
              home: AnimeList(),
            ),
          ),
        );

        expect(find.byType(ListViewSkeleton), findsOneWidget);

        expect(find.byType(SkeletonAvatar), findsNWidgets(10));
      });
    });

    group('[AnimeLoaded] state tests', () {
      testWidgets(
          'Are there at least 5 [AnimeCards] in [AnimeLoaded] status? Is there a [Sousou no Frieren 0] element in the list?',
          (WidgetTester tester) async {
        mocktail
            .when(() => animeCubit.state)
            .thenReturn(AnimeLoaded(mockAnimes));

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<AnimeCubit>(
                  create: (BuildContext ctx) => animeCubit,
                ),
              ],
              child: const MaterialApp(
                home: AnimeList(),
              ),
            ),
          ),
        );

        expect(find.byType(AnimeCard), findsAtLeastNWidgets(5));

        expect(find.text('Sousou no Frieren 0'), findsOneWidget);
      });

      testWidgets('Is it possible to scroll the List in [AnimeLoaded] state?',
          (WidgetTester tester) async {
        mocktail
            .when(() => animeCubit.state)
            .thenReturn(AnimeLoaded(mockAnimes));

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<AnimeCubit>(
                  create: (BuildContext ctx) => animeCubit,
                ),
              ],
              child: const MaterialApp(
                home: AnimeList(),
              ),
            ),
          ),
        );

        expect(find.text('Sousou no Frieren 0'), findsOneWidget);

        await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);

        expect(find.text('Sousou no Frieren 0'), findsNothing);
      });

      testWidgets(
          'In [Anime Loaded] state, is the List scrollable and does [PaginationLoading] occur?',
          (WidgetTester tester) async {
        mocktail
            .when(() => animeCubit.state)
            .thenReturn(AnimeLoaded(mockAnimes));

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<AnimeCubit>(
                  create: (BuildContext ctx) => animeCubit,
                ),
              ],
              child: const MaterialApp(
                home: AnimeList(),
              ),
            ),
          ),
        );

        // Ekranda "Sousou no Frieren 0" elemanını buluyoruz
        expect(find.text('Sousou no Frieren 0'), findsOneWidget);

        //ListView componentini scroll yapıyoruz ve en alta inmesini sağlıyoruz
        await tester.fling(find.byType(ListView), const Offset(0, -2000), 3000);

        // Ekranda son eleman olan "Sousou no Frieren 19" elemanının olmadığına emin oluyoruz.
        expect(find.text('Sousou no Frieren 19'), findsOneWidget);

        // Ekranda [PaginationLoading] widget'ının yüklendiğinden emin oluyoruz.
        expect(find.byType(PaginationLoading), findsOneWidget);
      });

      testWidgets('[AllAnimesListed] when [AnimeLoaded] and [isLastPage=true]',
          (WidgetTester tester) async {
        mocktail.when(() => animeCubit.state).thenReturn(
              AnimeLoaded(
                mockAnimes,
                isLastPage: true,
              ),
            );

        await mockNetworkImages(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<AnimeCubit>(
                  create: (BuildContext ctx) => animeCubit,
                ),
              ],
              child: const MaterialApp(
                home: AnimeList(),
              ),
            ),
          ),
        );

        // Ekranda "Sousou no Frieren 0" elemanını buluyoruz
        expect(find.text('Sousou no Frieren 0'), findsOneWidget);

        //ListView componentini scroll yapıyoruz ve en alta inmesini sağlıyoruz
        await tester.fling(find.byType(ListView), const Offset(0, -2000), 3000);

        // Ekranda son eleman olan "Sousou no Frieren 19" elemanının olmadığına emin oluyoruz.
        expect(find.text('Sousou no Frieren 19'), findsOneWidget);

        // Ekranda [AllAnimesListed] widget'ının yüklendiğinden emin oluyoruz.
        expect(find.byType(AllAnimesListed), findsOneWidget);
      });
    });
  });
}
