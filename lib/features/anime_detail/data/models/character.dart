import 'package:kraken_animelist/features/anime_detail/data/models/images.dart';

class Character {
  final int malId;
  final String url;
  final Images images;
  final String name;

  Character({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      malId: json['mal_id'],
      url: json['url'],
      images: Images.fromJson(json['images']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
    };
  }
}
