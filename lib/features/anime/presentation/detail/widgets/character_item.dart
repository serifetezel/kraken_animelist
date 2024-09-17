import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kraken_animelist/features/anime/data/model/detail/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(
            character.images.jpg.imageUrl,
          ),
          backgroundColor: Colors.transparent,
        ),
        AutoSizeText(
          character.name,
          maxFontSize: 15,
          textAlign: TextAlign.center,
          minFontSize: 10,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
