import 'genre.dart';
import 'images.dart';

class Anime {
  final int malId;
  final Images images;
  final String title;
  final int episodes;
  final double? score;
  final String synopsis;
  final List<Genre> genres;

  Anime({
    required this.malId,
    required this.images,
    required this.title,
    required this.episodes,
    required this.score,
    required this.synopsis,
    required this.genres,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'],
      images: Images.fromJson(json['images']),
      title: json['title'],
      episodes: json['episodes'] ?? 0,
      score: json['score'] != null ? (json['score'] as num).toDouble() : null,
      synopsis: json['synopsis'] ?? '',
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'images': images.toJson(),
      'title': title,
      'episodes': episodes,
      'score': score,
      'synopsis': synopsis,
      'genres': genres.map((e) => e.toJson()).toList(),
    };
  }
}
