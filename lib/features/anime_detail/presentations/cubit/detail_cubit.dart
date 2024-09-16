import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/services/api_service.dart';
import 'package:kraken_animelist/features/anime_detail/data/models/character.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final chopper = ApiService.create();
  DetailCubit() : super(DetailInitial());

  void getCharacterList(id) async {
    List<Character> characters;
    emit(DetailLoading());
    var response = await chopper.getCharacters(id);
    if (response.isSuccessful) {
      final characterObjectList = response.body['data'] as List;
      characters = characterObjectList
          .map((singleJsonObject) =>
              Character.fromJson(singleJsonObject['character']))
          .toList();
    } else {
      characters = <Character>[];
    }
    emit(DetailLoaded(characters));
  }
}
