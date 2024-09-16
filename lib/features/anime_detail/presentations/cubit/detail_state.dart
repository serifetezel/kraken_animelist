part of 'detail_cubit.dart';

abstract class DetailState {
  const DetailState();
}

class DetailInitial extends DetailState {
  DetailInitial();
}

class DetailLoading extends DetailState {
  DetailLoading();
}

class DetailLoaded extends DetailState {
  final List<Character> characterList;
  DetailLoaded(this.characterList);
}
