class Anime {
  final int malId;
  final String url;
  final Images images;
  final Trailer? trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final Aired aired;
  final String duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String background;
  final String season;
  final int year;
  final Broadcast broadcast;
  final List<Producer> producers;
  final List<dynamic> licensors;
  final List<Studio> studios;
  final List<Genre> genres;
  final List<dynamic> explicitGenres;
  final List<dynamic> themes;
  final List<Demographic> demographics;

  Anime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'],
      url: json['url'],
      images: Images.fromJson(json['images']),
      trailer:
          json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null,
      approved: json['approved'],
      titles: (json['titles'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'],
      source: json['source'],
      episodes: json['episodes'] ?? 0,
      status: json['status'],
      airing: json['airing'],
      aired: Aired.fromJson(json['aired']),
      duration: json['duration'],
      rating: json['rating'],
      score: (json['score'] as num).toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'] ?? '',
      year: json['year'] ?? 0,
      broadcast: Broadcast.fromJson(json['broadcast']),
      producers: (json['producers'] as List<dynamic>)
          .map((e) => Producer.fromJson(e as Map<String, dynamic>))
          .toList(),
      licensors: json['licensors'] as List<dynamic>,
      studios: (json['studios'] as List<dynamic>)
          .map((e) => Studio.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      explicitGenres: json['explicit_genres'] as List<dynamic>,
      themes: json['themes'] as List<dynamic>,
      demographics: (json['demographics'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'trailer': trailer?.toJson(),
      'approved': approved,
      'titles': titles.map((e) => e.toJson()).toList(),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': titleSynonyms,
      'type': type,
      'source': source,
      'episodes': episodes,
      'status': status,
      'airing': airing,
      'aired': aired.toJson(),
      'duration': duration,
      'rating': rating,
      'score': score,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'season': season,
      'year': year,
      'broadcast': broadcast.toJson(),
      'producers': producers.map((e) => e.toJson()).toList(),
      'licensors': licensors,
      'studios': studios.map((e) => e.toJson()).toList(),
      'genres': genres.map((e) => e.toJson()).toList(),
      'explicit_genres': explicitGenres,
      'themes': themes,
      'demographics': demographics.map((e) => e.toJson()).toList(),
    };
  }
}

class Images {
  final ImageDetail jpg;
  final ImageDetail webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: ImageDetail.fromJson(json['jpg']),
      webp: ImageDetail.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class ImageDetail {
  final String imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  ImageDetail({
    required this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final TrailerImages images;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      youtubeId: json['youtube_id'] ?? '',
      url: json['url'] ?? '',
      embedUrl: json['embed_url'] ?? '',
      images: TrailerImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class TrailerImages {
  final String imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  TrailerImages({
    required this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory TrailerImages.fromJson(Map<String, dynamic> json) {
    return TrailerImages(
      imageUrl: json['image_url'] ?? '',
      smallImageUrl: json['small_image_url'] ?? '',
      mediumImageUrl: json['medium_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
      maximumImageUrl: json['maximum_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

class Title {
  final String type;
  final String title;

  Title({
    required this.type,
    required this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      type: json['type'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}

class Aired {
  final String from;
  final String to;
  final AiredProp prop;
  final String string;

  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) {
    return Aired(
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      prop: AiredProp.fromJson(json['prop']),
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'prop': prop.toJson(),
      'string': string,
    };
  }
}

class AiredProp {
  final DateProp from;
  final DateProp to;

  AiredProp({
    required this.from,
    required this.to,
  });

  factory AiredProp.fromJson(Map<String, dynamic> json) {
    return AiredProp(
      from: DateProp.fromJson(json['from']),
      to: DateProp.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}

class DateProp {
  final int day;
  final int month;
  final int year;

  DateProp({
    required this.day,
    required this.month,
    required this.year,
  });

  factory DateProp.fromJson(Map<String, dynamic> json) {
    return DateProp(
      day: json['day'] ?? 0,
      month: json['month'] ?? 0,
      year: json['year'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
    };
  }
}

class Broadcast {
  final String day;
  final String time;
  final String timezone;
  final String string;

  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
      day: json['day'] ?? '',
      time: json['time'] ?? '',
      timezone: json['timezone'] ?? '',
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone,
      'string': string,
    };
  }
}

class Producer {
  final int malId;
  final String type;
  final String name;
  final String url;

  Producer({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Producer.fromJson(Map<String, dynamic> json) {
    return Producer(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class Studio {
  final int malId;
  final String type;
  final String name;
  final String url;

  Studio({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class Genre {
  final int malId;
  final String type;
  final String name;
  final String url;

  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class Demographic {
  final int malId;
  final String type;
  final String name;
  final String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromJson(Map<String, dynamic> json) {
    return Demographic(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}
