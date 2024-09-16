import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/features/anime_list/presentation/cubit/anime_cubit.dart';
import 'package:kraken_animelist/features/anime_list/presentation/screens/anime_list.dart';

import 'features/anime_detail/presentations/cubit/detail_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AnimeCubit>(
            create: (BuildContext context) => AnimeCubit(),
          ),
          BlocProvider<DetailCubit>(
            create: (BuildContext context) => DetailCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AnimeList(),
        ));
  }
}
