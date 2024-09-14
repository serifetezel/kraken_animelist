import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';
import 'package:kraken_animelist/features/anime_detail/presentations/screens/anime.detail.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  List<dynamic> data = [
    {
      "mal_id": 52991,
      "url": "https://myanimelist.net/anime/52991/Sousou_no_Frieren",
      "images": {
        "jpg": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006.jpg",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006t.jpg",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006l.jpg"
        },
        "webp": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006.webp",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006t.webp",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1015/138006l.webp"
        }
      },
      "trailer": {
        "youtube_id": "ZEkwCGJ3o7M",
        "url": "https://www.youtube.com/watch?v=ZEkwCGJ3o7M",
        "embed_url":
            "https://www.youtube.com/embed/ZEkwCGJ3o7M?enablejsapi=1&wmode=opaque&autoplay=1",
        "images": {
          "image_url": "https://img.youtube.com/vi/ZEkwCGJ3o7M/default.jpg",
          "small_image_url":
              "https://img.youtube.com/vi/ZEkwCGJ3o7M/sddefault.jpg",
          "medium_image_url":
              "https://img.youtube.com/vi/ZEkwCGJ3o7M/mqdefault.jpg",
          "large_image_url":
              "https://img.youtube.com/vi/ZEkwCGJ3o7M/hqdefault.jpg",
          "maximum_image_url":
              "https://img.youtube.com/vi/ZEkwCGJ3o7M/maxresdefault.jpg"
        }
      },
      "approved": true,
      "titles": [
        {"type": "Default", "title": "Sousou no Frieren"},
        {"type": "Synonym", "title": "Frieren at the Funeral"},
        {"type": "Japanese", "title": "葬送のフリーレン"},
        {"type": "English", "title": "Frieren: Beyond Journey's End"}
      ],
      "title": "Sousou no Frieren",
      "title_english": "Frieren: Beyond Journey's End",
      "title_japanese": "葬送のフリーレン",
      "title_synonyms": ["Frieren at the Funeral"],
      "type": "TV",
      "source": "Manga",
      "episodes": 28,
      "status": "Finished Airing",
      "airing": false,
      "aired": {
        "from": "2023-09-29T00:00:00+00:00",
        "to": "2024-03-22T00:00:00+00:00",
        "prop": {
          "from": {"day": 29, "month": 9, "year": 2023},
          "to": {"day": 22, "month": 3, "year": 2024}
        },
        "string": "Sep 29, 2023 to Mar 22, 2024"
      },
      "duration": "24 min per ep",
      "rating": "PG-13 - Teens 13 or older",
      "score": 9.33,
      "scored_by": 498319,
      "rank": 1,
      "popularity": 203,
      "members": 885841,
      "favorites": 51712,
      "synopsis":
          "During their decade-long quest to defeat the Demon King, the members of the hero's party—Himmel himself, the priest Heiter, the dwarf warrior Eisen, and the elven mage Frieren—forge bonds through adventures and battles, creating unforgettable precious memories for most of them.\n\nHowever, the time that Frieren spends with her comrades is equivalent to merely a fraction of her life, which has lasted over a thousand years. When the party disbands after their victory, Frieren casually returns to her \"usual\" routine of collecting spells across the continent. Due to her different sense of time, she seemingly holds no strong feelings toward the experiences she went through.\n\nAs the years pass, Frieren gradually realizes how her days in the hero's party truly impacted her. Witnessing the deaths of two of her former companions, Frieren begins to regret having taken their presence for granted; she vows to better understand humans and create real personal connections. Although the story of that once memorable journey has long ended, a new tale is about to begin.\n\n[Written by MAL Rewrite]",
      "background":
          "Sousou no Frieren was released on Blu-ray and DVD in seven volumes from January 24, 2024, to July 17, 2024.",
      "season": "fall",
      "year": 2023,
      "broadcast": {
        "day": "Fridays",
        "time": "23:00",
        "timezone": "Asia/Tokyo",
        "string": "Fridays at 23:00 (JST)"
      },
      "producers": [
        {
          "mal_id": 17,
          "type": "anime",
          "name": "Aniplex",
          "url": "https://myanimelist.net/anime/producer/17/Aniplex"
        },
        {
          "mal_id": 53,
          "type": "anime",
          "name": "Dentsu",
          "url": "https://myanimelist.net/anime/producer/53/Dentsu"
        },
        {
          "mal_id": 62,
          "type": "anime",
          "name": "Shogakukan-Shueisha Productions",
          "url":
              "https://myanimelist.net/anime/producer/62/Shogakukan-Shueisha_Productions"
        },
        {
          "mal_id": 1003,
          "type": "anime",
          "name": "Nippon Television Network",
          "url":
              "https://myanimelist.net/anime/producer/1003/Nippon_Television_Network"
        },
        {
          "mal_id": 1143,
          "type": "anime",
          "name": "TOHO animation",
          "url": "https://myanimelist.net/anime/producer/1143/TOHO_animation"
        },
        {
          "mal_id": 1430,
          "type": "anime",
          "name": "Shogakukan",
          "url": "https://myanimelist.net/anime/producer/1430/Shogakukan"
        }
      ],
      "licensors": [],
      "studios": [
        {
          "mal_id": 11,
          "type": "anime",
          "name": "Madhouse",
          "url": "https://myanimelist.net/anime/producer/11/Madhouse"
        }
      ],
      "genres": [
        {
          "mal_id": 2,
          "type": "anime",
          "name": "Adventure",
          "url": "https://myanimelist.net/anime/genre/2/Adventure"
        },
        {
          "mal_id": 8,
          "type": "anime",
          "name": "Drama",
          "url": "https://myanimelist.net/anime/genre/8/Drama"
        },
        {
          "mal_id": 10,
          "type": "anime",
          "name": "Fantasy",
          "url": "https://myanimelist.net/anime/genre/10/Fantasy"
        },
      ],
      "explicit_genres": [],
      "themes": [],
      "demographics": [
        {
          "mal_id": 27,
          "type": "anime",
          "name": "Shounen",
          "url": "https://myanimelist.net/anime/genre/27/Shounen"
        }
      ]
    },
    {
      "mal_id": 5114,
      "url":
          "https://myanimelist.net/anime/5114/Fullmetal_Alchemist__Brotherhood",
      "images": {
        "jpg": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745.jpg",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745t.jpg",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745l.jpg"
        },
        "webp": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745.webp",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745t.webp",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1208/94745l.webp"
        }
      },
      "trailer": {
        "youtube_id": "--IcmZkvL0Q",
        "url": "https://www.youtube.com/watch?v=--IcmZkvL0Q",
        "embed_url":
            "https://www.youtube.com/embed/--IcmZkvL0Q?enablejsapi=1&wmode=opaque&autoplay=1",
        "images": {
          "image_url": "https://img.youtube.com/vi/--IcmZkvL0Q/default.jpg",
          "small_image_url":
              "https://img.youtube.com/vi/--IcmZkvL0Q/sddefault.jpg",
          "medium_image_url":
              "https://img.youtube.com/vi/--IcmZkvL0Q/mqdefault.jpg",
          "large_image_url":
              "https://img.youtube.com/vi/--IcmZkvL0Q/hqdefault.jpg",
          "maximum_image_url":
              "https://img.youtube.com/vi/--IcmZkvL0Q/maxresdefault.jpg"
        }
      },
      "approved": true,
      "titles": [
        {"type": "Default", "title": "Fullmetal Alchemist: Brotherhood"},
        {
          "type": "Synonym",
          "title": "Hagane no Renkinjutsushi: Fullmetal Alchemist"
        },
        {"type": "Synonym", "title": "Fullmetal Alchemist (2009)"},
        {"type": "Synonym", "title": "FMA"},
        {"type": "Synonym", "title": "FMAB"},
        {"type": "Japanese", "title": "鋼の錬金術師 FULLMETAL ALCHEMIST"},
        {"type": "English", "title": "Fullmetal Alchemist: Brotherhood"},
        {"type": "French", "title": "Fullmetal Alchemist Brotherhood"}
      ],
      "title": "Fullmetal Alchemist: Brotherhood",
      "title_english": "Fullmetal Alchemist: Brotherhood",
      "title_japanese": "鋼の錬金術師 FULLMETAL ALCHEMIST",
      "title_synonyms": [
        "Hagane no Renkinjutsushi: Fullmetal Alchemist",
        "Fullmetal Alchemist (2009)",
        "FMA",
        "FMAB"
      ],
      "type": "TV",
      "source": "Manga",
      "episodes": 64,
      "status": "Finished Airing",
      "airing": false,
      "aired": {
        "from": "2009-04-05T00:00:00+00:00",
        "to": "2010-07-04T00:00:00+00:00",
        "prop": {
          "from": {"day": 5, "month": 4, "year": 2009},
          "to": {"day": 4, "month": 7, "year": 2010}
        },
        "string": "Apr 5, 2009 to Jul 4, 2010"
      },
      "duration": "24 min per ep",
      "rating": "R - 17+ (violence & profanity)",
      "score": 9.09,
      "scored_by": 2154650,
      "rank": 2,
      "popularity": 3,
      "members": 3410872,
      "favorites": 228006,
      "synopsis":
          "After a horrific alchemy experiment goes wrong in the Elric household, brothers Edward and Alphonse are left in a catastrophic new reality. Ignoring the alchemical principle banning human transmutation, the boys attempted to bring their recently deceased mother back to life. Instead, they suffered brutal personal loss: Alphonse's body disintegrated while Edward lost a leg and then sacrificed an arm to keep Alphonse's soul in the physical realm by binding it to a hulking suit of armor.\n\nThe brothers are rescued by their neighbor Pinako Rockbell and her granddaughter Winry. Known as a bio-mechanical engineering prodigy, Winry creates prosthetic limbs for Edward by utilizing \"automail,\" a tough, versatile metal used in robots and combat armor. After years of training, the Elric brothers set off on a quest to restore their bodies by locating the Philosopher's Stone—a powerful gem that allows an alchemist to defy the traditional laws of Equivalent Exchange.\n\nAs Edward becomes an infamous alchemist and gains the nickname \"Fullmetal,\" the boys' journey embroils them in a growing conspiracy that threatens the fate of the world.\n\n[Written by MAL Rewrite]",
      "background": "",
      "season": "spring",
      "year": 2009,
      "broadcast": {
        "day": "Sundays",
        "time": "17:00",
        "timezone": "Asia/Tokyo",
        "string": "Sundays at 17:00 (JST)"
      },
      "producers": [
        {
          "mal_id": 17,
          "type": "anime",
          "name": "Aniplex",
          "url": "https://myanimelist.net/anime/producer/17/Aniplex"
        },
        {
          "mal_id": 58,
          "type": "anime",
          "name": "Square Enix",
          "url": "https://myanimelist.net/anime/producer/58/Square_Enix"
        },
        {
          "mal_id": 143,
          "type": "anime",
          "name": "Mainichi Broadcasting System",
          "url":
              "https://myanimelist.net/anime/producer/143/Mainichi_Broadcasting_System"
        },
        {
          "mal_id": 1155,
          "type": "anime",
          "name": "Studio Moriken",
          "url": "https://myanimelist.net/anime/producer/1155/Studio_Moriken"
        }
      ],
      "licensors": [
        {
          "mal_id": 102,
          "type": "anime",
          "name": "Funimation",
          "url": "https://myanimelist.net/anime/producer/102/Funimation"
        },
        {
          "mal_id": 493,
          "type": "anime",
          "name": "Aniplex of America",
          "url": "https://myanimelist.net/anime/producer/493/Aniplex_of_America"
        }
      ],
      "studios": [
        {
          "mal_id": 4,
          "type": "anime",
          "name": "Bones",
          "url": "https://myanimelist.net/anime/producer/4/Bones"
        }
      ],
      "genres": [
        {
          "mal_id": 1,
          "type": "anime",
          "name": "Action",
          "url": "https://myanimelist.net/anime/genre/1/Action"
        },
        {
          "mal_id": 2,
          "type": "anime",
          "name": "Adventure",
          "url": "https://myanimelist.net/anime/genre/2/Adventure"
        },
        {
          "mal_id": 8,
          "type": "anime",
          "name": "Drama",
          "url": "https://myanimelist.net/anime/genre/8/Drama"
        },
        {
          "mal_id": 10,
          "type": "anime",
          "name": "Fantasy",
          "url": "https://myanimelist.net/anime/genre/10/Fantasy"
        }
      ],
      "explicit_genres": [],
      "themes": [
        {
          "mal_id": 38,
          "type": "anime",
          "name": "Military",
          "url": "https://myanimelist.net/anime/genre/38/Military"
        }
      ],
      "demographics": [
        {
          "mal_id": 27,
          "type": "anime",
          "name": "Shounen",
          "url": "https://myanimelist.net/anime/genre/27/Shounen"
        }
      ]
    },
    {
      "mal_id": 9253,
      "url": "https://myanimelist.net/anime/9253/Steins_Gate",
      "images": {
        "jpg": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974.jpg",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974t.jpg",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974l.jpg"
        },
        "webp": {
          "image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974.webp",
          "small_image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974t.webp",
          "large_image_url":
              "https://cdn.myanimelist.net/images/anime/1935/127974l.webp"
        }
      },
      "trailer": {
        "youtube_id": "27OZc-ku6is",
        "url": "https://www.youtube.com/watch?v=27OZc-ku6is",
        "embed_url":
            "https://www.youtube.com/embed/27OZc-ku6is?enablejsapi=1&wmode=opaque&autoplay=1",
        "images": {
          "image_url": "https://img.youtube.com/vi/27OZc-ku6is/default.jpg",
          "small_image_url":
              "https://img.youtube.com/vi/27OZc-ku6is/sddefault.jpg",
          "medium_image_url":
              "https://img.youtube.com/vi/27OZc-ku6is/mqdefault.jpg",
          "large_image_url":
              "https://img.youtube.com/vi/27OZc-ku6is/hqdefault.jpg",
          "maximum_image_url":
              "https://img.youtube.com/vi/27OZc-ku6is/maxresdefault.jpg"
        }
      },
      "approved": true,
      "titles": [
        {"type": "Default", "title": "Steins;Gate"},
        {"type": "Japanese", "title": "STEINS;GATE"},
        {"type": "English", "title": "Steins;Gate"}
      ],
      "title": "Steins;Gate",
      "title_english": "Steins;Gate",
      "title_japanese": "STEINS;GATE",
      "title_synonyms": [],
      "type": "TV",
      "source": "Visual novel",
      "episodes": 24,
      "status": "Finished Airing",
      "airing": false,
      "aired": {
        "from": "2011-04-06T00:00:00+00:00",
        "to": "2011-09-14T00:00:00+00:00",
        "prop": {
          "from": {"day": 6, "month": 4, "year": 2011},
          "to": {"day": 14, "month": 9, "year": 2011}
        },
        "string": "Apr 6, 2011 to Sep 14, 2011"
      },
      "duration": "24 min per ep",
      "rating": "PG-13 - Teens 13 or older",
      "score": 9.07,
      "scored_by": 1422312,
      "rank": 3,
      "popularity": 14,
      "members": 2613706,
      "favorites": 191028,
      "synopsis":
          "Eccentric scientist Rintarou Okabe has a never-ending thirst for scientific exploration. Together with his ditzy but well-meaning friend Mayuri Shiina and his roommate Itaru Hashida, Okabe founds the Future Gadget Laboratory in the hopes of creating technological innovations that baffle the human psyche. Despite claims of grandeur, the only notable \"gadget\" the trio have created is a microwave that has the mystifying power to turn bananas into green goo.\n\nHowever, when Okabe attends a conference on time travel, he experiences a series of strange events that lead him to believe that there is more to the \"Phone Microwave\" gadget than meets the eye. Apparently able to send text messages into the past using the microwave, Okabe dabbles further with the \"time machine,\" attracting the ire and attention of the mysterious organization SERN.\n\nDue to the novel discovery, Okabe and his friends find themselves in an ever-present danger. As he works to mitigate the damage his invention has caused to the timeline, Okabe fights a battle to not only save his loved ones but also to preserve his degrading sanity.\n\n[Written by MAL Rewrite]",
      "background":
          "Steins;Gate is based on 5pb. and Nitroplus' visual novel of the same title released in 2009. It serves as the second entry in the Science Adventure series.",
      "season": "spring",
      "year": 2011,
      "broadcast": {
        "day": "Wednesdays",
        "time": "02:05",
        "timezone": "Asia/Tokyo",
        "string": "Wednesdays at 02:05 (JST)"
      },
      "producers": [
        {
          "mal_id": 61,
          "type": "anime",
          "name": "Frontier Works",
          "url": "https://myanimelist.net/anime/producer/61/Frontier_Works"
        },
        {
          "mal_id": 108,
          "type": "anime",
          "name": "Media Factory",
          "url": "https://myanimelist.net/anime/producer/108/Media_Factory"
        },
        {
          "mal_id": 113,
          "type": "anime",
          "name": "Kadokawa Shoten",
          "url": "https://myanimelist.net/anime/producer/113/Kadokawa_Shoten"
        },
        {
          "mal_id": 166,
          "type": "anime",
          "name": "Movic",
          "url": "https://myanimelist.net/anime/producer/166/Movic"
        },
        {
          "mal_id": 238,
          "type": "anime",
          "name": "AT-X",
          "url": "https://myanimelist.net/anime/producer/238/AT-X"
        },
        {
          "mal_id": 352,
          "type": "anime",
          "name": "Kadokawa Pictures Japan",
          "url":
              "https://myanimelist.net/anime/producer/352/Kadokawa_Pictures_Japan"
        },
        {
          "mal_id": 459,
          "type": "anime",
          "name": "Nitroplus",
          "url": "https://myanimelist.net/anime/producer/459/Nitroplus"
        }
      ],
      "licensors": [
        {
          "mal_id": 102,
          "type": "anime",
          "name": "Funimation",
          "url": "https://myanimelist.net/anime/producer/102/Funimation"
        }
      ],
      "studios": [
        {
          "mal_id": 314,
          "type": "anime",
          "name": "White Fox",
          "url": "https://myanimelist.net/anime/producer/314/White_Fox"
        }
      ],
      "genres": [
        {
          "mal_id": 8,
          "type": "anime",
          "name": "Drama",
          "url": "https://myanimelist.net/anime/genre/8/Drama"
        },
        {
          "mal_id": 24,
          "type": "anime",
          "name": "Sci-Fi",
          "url": "https://myanimelist.net/anime/genre/24/Sci-Fi"
        },
        {
          "mal_id": 41,
          "type": "anime",
          "name": "Suspense",
          "url": "https://myanimelist.net/anime/genre/41/Suspense"
        }
      ],
      "explicit_genres": [],
      "themes": [
        {
          "mal_id": 40,
          "type": "anime",
          "name": "Psychological",
          "url": "https://myanimelist.net/anime/genre/40/Psychological"
        },
        {
          "mal_id": 78,
          "type": "anime",
          "name": "Time Travel",
          "url": "https://myanimelist.net/anime/genre/78/Time_Travel"
        }
      ],
      "demographics": []
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        top: true,
        child: ListView.builder(
          itemCount: data.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return animeCard(context, index);
          },
        ),
      ),
    );
  }

  SizedBox animeCard(BuildContext context, int index) {
    return SizedBox(
      height: context.calculateHeight(7),
      width: context.calculateWidth(1),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimeDetail(
                id: data[index]['mal_id'],
                imageUrl: data[index]['images']['jpg']['large_image_url'],
                title: data[index]['title'],
                ratingScore: data[index]['score'],
                genres: data[index]['genres'],
                synopsis: data[index]['synopsis'],
                episodesCount: data[index]['episodes'],
              ),
            ),
          );
        },
        child: Card(
          elevation: 1.5,
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCardImage(context, index),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCardTitle(index, context),
                      buildScoreEpisodes(index),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildCardScore(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          initialRating: (data[index]['score'] * .5),
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25,
          glowColor: Colors.amber,
          itemPadding: const EdgeInsets.symmetric(horizontal: 3),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          ignoreGestures: true,
          onRatingUpdate: (rating) {},
        ),
        Text(
          '${data[index]['score']} / 10',
        )
      ],
    );
  }

  Padding buildScoreEpisodes(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildScore(index),
          Text(
            'Episodes: ${data[index]['episodes']}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Row buildScore(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '${data[index]['score']} / 10',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  AutoSizeText buildCardTitle(int index, BuildContext context) {
    return AutoSizeText(
      data[index]['title'],
      maxLines: 2,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget buildCardImage(BuildContext context, int index) {
    return Hero(
      tag: data[index]['mal_id'],
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: context.calculateWidth(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                data[index]['images']['jpg']['image_url']),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.0,
      foregroundColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text('Kraken Anime List'),
    );
  }
}
