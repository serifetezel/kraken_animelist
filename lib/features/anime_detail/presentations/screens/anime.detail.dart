import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';

class AnimeDetail extends StatefulWidget {
  final int id;
  final String? imageUrl;
  final String? title;
  final double? ratingScore;
  final List? genres;
  final String? synopsis;
  final int? episodesCount;
  const AnimeDetail(
      {super.key,
      required this.id,
      this.imageUrl,
      this.title,
      this.ratingScore,
      this.genres,
      this.synopsis,
      this.episodesCount});

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  int maxLines = 3;
  late String limitedSynopsis;

  List<dynamic> data = [
    {
      "character": {
        "mal_id": 188176,
        "url": "https://myanimelist.net/character/188176/Fern",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.jpg?s=b280b410b588ebcd3fd30ac6fad02978"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.webp?s=b280b410b588ebcd3fd30ac6fad02978",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083t.webp?s=b280b410b588ebcd3fd30ac6fad02978"
          }
        },
        "name": "Fern"
      },
      "role": "Main",
      "favorites": 3375,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47097,
            "url": "https://myanimelist.net/people/47097/Kana_Ichinose",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/70398.jpg?s=01ab90c96ed2a89ebc025b02d8c38893"
              }
            },
            "name": "Ichinose, Kana"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 41966,
            "url": "https://myanimelist.net/people/41966/Jill_Harris",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/43821.jpg?s=8610b4cfc43832af5a4693ba65aea62d"
              }
            },
            "name": "Harris, Jill"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 69039,
            "url": "https://myanimelist.net/people/69039/Jehanne_Thellier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Thellier, Jehanne"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 55789,
            "url": "https://myanimelist.net/people/55789/Maria_Clara_Rosis",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/81553.jpg?s=1e4b444a732541012720830c126011f3"
              }
            },
            "name": "Rosis, Maria Clara"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 42650,
            "url": "https://myanimelist.net/people/42650/Agnese_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/46013.jpg?s=f6c96bb2fa5bc12ca95ddbaa89084311"
              }
            },
            "name": "Marteddu, Agnese"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 63795,
            "url": "https://myanimelist.net/people/63795/Azucena_Estrada",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/73695.jpg?s=40f919e6402c7748e196e320bdfc1d7b"
              }
            },
            "name": "Estrada, Azucena"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 37649,
            "url": "https://myanimelist.net/people/37649/Linda_Fölster",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/39598.jpg?s=4763fb1111ff7ad2700f2dc77e4b6c77"
              }
            },
            "name": "Fölster, Linda"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 184947,
        "url": "https://myanimelist.net/character/184947/Frieren",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.jpg?s=1706604ec2ca141a172526b8dedf3177"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.webp?s=1706604ec2ca141a172526b8dedf3177",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105t.webp?s=1706604ec2ca141a172526b8dedf3177"
          }
        },
        "name": "Frieren"
      },
      "role": "Main",
      "favorites": 19304,
      "voice_actors": [
        {
          "person": {
            "mal_id": 17215,
            "url": "https://myanimelist.net/people/17215/Atsumi_Tanezaki",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/77190.jpg?s=ed33c5d429051864f3af3fe2e64eb970"
              }
            },
            "name": "Tanezaki, Atsumi"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 35117,
            "url": "https://myanimelist.net/people/35117/Mallorie_Rodak",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40976.jpg?s=5a1f44329cebb84e57d015299e4c7f6c"
              }
            },
            "name": "Rodak, Mallorie"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 21893,
            "url": "https://myanimelist.net/people/21893/Marie_Nonnenmacher",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71214.jpg?s=b5e5e78b6b436cb9fdb6cbbb6cf681bc"
              }
            },
            "name": "Nonnenmacher, Marie"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 53037,
            "url": "https://myanimelist.net/people/53037/Jacque_Souza",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/77023.jpg?s=6adb2b1bd856b67e7411e9bb5e203845"
              }
            },
            "name": "Souza, Jacque"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 35767,
            "url": "https://myanimelist.net/people/35767/Martina_Felli",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/74407.jpg?s=9bf923e68823fbb869f633484f5dab86"
              }
            },
            "name": "Felli, Martina"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 56690,
            "url": "https://myanimelist.net/people/56690/Erika_Ugalde",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71299.jpg?s=799f4d3249ec390ef3c3117113095efd"
              }
            },
            "name": "Ugalde, Erika"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 40043,
            "url": "https://myanimelist.net/people/40043/Julia_Casper",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40335.jpg?s=b01c2b7858aa1d326cce91eec0d34cc0"
              }
            },
            "name": "Casper, Julia"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188177,
        "url": "https://myanimelist.net/character/188177/Stark",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.jpg?s=ea781ce6864ae29a56f5ce3d223d9496"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.webp?s=ea781ce6864ae29a56f5ce3d223d9496",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292t.webp?s=ea781ce6864ae29a56f5ce3d223d9496"
          }
        },
        "name": "Stark"
      },
      "role": "Main",
      "favorites": 1757,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47439,
            "url": "https://myanimelist.net/people/47439/Chiaki_Kobayashi",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/66505.jpg?s=b8e3db933b88d9d18dd0646526d46973"
              }
            },
            "name": "Kobayashi, Chiaki"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 47046,
            "url": "https://myanimelist.net/people/47046/Jordan_Dash_Cruz",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/50962.jpg?s=87cea43b9567d828fdfdb015a85c7b5d"
              }
            },
            "name": "Cruz, Jordan Dash"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 20100,
            "url": "https://myanimelist.net/people/20100/Arisa_Kiyoto",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/54017.jpg?s=16c30b0399a3c263687fa263befe7be0"
              }
            },
            "name": "Kiyoto, Arisa"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 56907,
            "url": "https://myanimelist.net/people/56907/Lucas_Miagusuku",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/77705.jpg?s=a66b69ddc1b52afc9206cac31520f138"
              }
            },
            "name": "Miagusuku, Lucas"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 1613,
            "url": "https://myanimelist.net/people/1613/Brigitte_Lecordier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/67476.jpg?s=ff50105bede34513c44198b231e6e6b1"
              }
            },
            "name": "Lecordier, Brigitte"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 42908,
            "url": "https://myanimelist.net/people/42908/Tito_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/46474.jpg?s=c7724464c1d9a85235ce3d76f4db0613"
              }
            },
            "name": "Marteddu, Tito"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 62748,
            "url":
                "https://myanimelist.net/people/62748/Eduardo_Martínez_Torizes",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/73055.jpg?s=33e5d25725c98b2192077050462fb849"
              }
            },
            "name": "Martínez Torizes, Eduardo"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 414,
            "url": "https://myanimelist.net/people/414/Brittney_Karbowski",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/34809.jpg?s=1c3379b3322880262fca475d33982d5a"
              }
            },
            "name": "Karbowski, Brittney"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 45755,
            "url": "https://myanimelist.net/people/45755/Kelyan_Blanc",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/81432.jpg?s=e30e31911d53c953f94645d90b506e17"
              }
            },
            "name": "Blanc, Kelyan"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 63072,
            "url": "https://myanimelist.net/people/63072/Janek_Schächter",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Schächter, Janek"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188176,
        "url": "https://myanimelist.net/character/188176/Fern",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.jpg?s=b280b410b588ebcd3fd30ac6fad02978"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.webp?s=b280b410b588ebcd3fd30ac6fad02978",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083t.webp?s=b280b410b588ebcd3fd30ac6fad02978"
          }
        },
        "name": "Fern"
      },
      "role": "Main",
      "favorites": 3375,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47097,
            "url": "https://myanimelist.net/people/47097/Kana_Ichinose",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/70398.jpg?s=01ab90c96ed2a89ebc025b02d8c38893"
              }
            },
            "name": "Ichinose, Kana"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 41966,
            "url": "https://myanimelist.net/people/41966/Jill_Harris",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/43821.jpg?s=8610b4cfc43832af5a4693ba65aea62d"
              }
            },
            "name": "Harris, Jill"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 69039,
            "url": "https://myanimelist.net/people/69039/Jehanne_Thellier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Thellier, Jehanne"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 55789,
            "url": "https://myanimelist.net/people/55789/Maria_Clara_Rosis",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/81553.jpg?s=1e4b444a732541012720830c126011f3"
              }
            },
            "name": "Rosis, Maria Clara"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 42650,
            "url": "https://myanimelist.net/people/42650/Agnese_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/46013.jpg?s=f6c96bb2fa5bc12ca95ddbaa89084311"
              }
            },
            "name": "Marteddu, Agnese"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 63795,
            "url": "https://myanimelist.net/people/63795/Azucena_Estrada",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/73695.jpg?s=40f919e6402c7748e196e320bdfc1d7b"
              }
            },
            "name": "Estrada, Azucena"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 37649,
            "url": "https://myanimelist.net/people/37649/Linda_Fölster",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/39598.jpg?s=4763fb1111ff7ad2700f2dc77e4b6c77"
              }
            },
            "name": "Fölster, Linda"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 184947,
        "url": "https://myanimelist.net/character/184947/Frieren",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.jpg?s=1706604ec2ca141a172526b8dedf3177"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.webp?s=1706604ec2ca141a172526b8dedf3177",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105t.webp?s=1706604ec2ca141a172526b8dedf3177"
          }
        },
        "name": "Frieren"
      },
      "role": "Main",
      "favorites": 19304,
      "voice_actors": [
        {
          "person": {
            "mal_id": 17215,
            "url": "https://myanimelist.net/people/17215/Atsumi_Tanezaki",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/77190.jpg?s=ed33c5d429051864f3af3fe2e64eb970"
              }
            },
            "name": "Tanezaki, Atsumi"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 35117,
            "url": "https://myanimelist.net/people/35117/Mallorie_Rodak",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40976.jpg?s=5a1f44329cebb84e57d015299e4c7f6c"
              }
            },
            "name": "Rodak, Mallorie"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 21893,
            "url": "https://myanimelist.net/people/21893/Marie_Nonnenmacher",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71214.jpg?s=b5e5e78b6b436cb9fdb6cbbb6cf681bc"
              }
            },
            "name": "Nonnenmacher, Marie"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 53037,
            "url": "https://myanimelist.net/people/53037/Jacque_Souza",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/77023.jpg?s=6adb2b1bd856b67e7411e9bb5e203845"
              }
            },
            "name": "Souza, Jacque"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 35767,
            "url": "https://myanimelist.net/people/35767/Martina_Felli",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/74407.jpg?s=9bf923e68823fbb869f633484f5dab86"
              }
            },
            "name": "Felli, Martina"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 56690,
            "url": "https://myanimelist.net/people/56690/Erika_Ugalde",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71299.jpg?s=799f4d3249ec390ef3c3117113095efd"
              }
            },
            "name": "Ugalde, Erika"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 40043,
            "url": "https://myanimelist.net/people/40043/Julia_Casper",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40335.jpg?s=b01c2b7858aa1d326cce91eec0d34cc0"
              }
            },
            "name": "Casper, Julia"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188177,
        "url": "https://myanimelist.net/character/188177/Stark",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.jpg?s=ea781ce6864ae29a56f5ce3d223d9496"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.webp?s=ea781ce6864ae29a56f5ce3d223d9496",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292t.webp?s=ea781ce6864ae29a56f5ce3d223d9496"
          }
        },
        "name": "Stark"
      },
      "role": "Main",
      "favorites": 1757,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47439,
            "url": "https://myanimelist.net/people/47439/Chiaki_Kobayashi",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/66505.jpg?s=b8e3db933b88d9d18dd0646526d46973"
              }
            },
            "name": "Kobayashi, Chiaki"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 47046,
            "url": "https://myanimelist.net/people/47046/Jordan_Dash_Cruz",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/50962.jpg?s=87cea43b9567d828fdfdb015a85c7b5d"
              }
            },
            "name": "Cruz, Jordan Dash"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 20100,
            "url": "https://myanimelist.net/people/20100/Arisa_Kiyoto",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/54017.jpg?s=16c30b0399a3c263687fa263befe7be0"
              }
            },
            "name": "Kiyoto, Arisa"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 56907,
            "url": "https://myanimelist.net/people/56907/Lucas_Miagusuku",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/77705.jpg?s=a66b69ddc1b52afc9206cac31520f138"
              }
            },
            "name": "Miagusuku, Lucas"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 1613,
            "url": "https://myanimelist.net/people/1613/Brigitte_Lecordier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/67476.jpg?s=ff50105bede34513c44198b231e6e6b1"
              }
            },
            "name": "Lecordier, Brigitte"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 42908,
            "url": "https://myanimelist.net/people/42908/Tito_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/46474.jpg?s=c7724464c1d9a85235ce3d76f4db0613"
              }
            },
            "name": "Marteddu, Tito"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 62748,
            "url":
                "https://myanimelist.net/people/62748/Eduardo_Martínez_Torizes",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/73055.jpg?s=33e5d25725c98b2192077050462fb849"
              }
            },
            "name": "Martínez Torizes, Eduardo"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 414,
            "url": "https://myanimelist.net/people/414/Brittney_Karbowski",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/34809.jpg?s=1c3379b3322880262fca475d33982d5a"
              }
            },
            "name": "Karbowski, Brittney"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 45755,
            "url": "https://myanimelist.net/people/45755/Kelyan_Blanc",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/81432.jpg?s=e30e31911d53c953f94645d90b506e17"
              }
            },
            "name": "Blanc, Kelyan"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 63072,
            "url": "https://myanimelist.net/people/63072/Janek_Schächter",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Schächter, Janek"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188176,
        "url": "https://myanimelist.net/character/188176/Fern",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.jpg?s=b280b410b588ebcd3fd30ac6fad02978"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.webp?s=b280b410b588ebcd3fd30ac6fad02978",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083t.webp?s=b280b410b588ebcd3fd30ac6fad02978"
          }
        },
        "name": "Fern"
      },
      "role": "Main",
      "favorites": 3375,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47097,
            "url": "https://myanimelist.net/people/47097/Kana_Ichinose",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/70398.jpg?s=01ab90c96ed2a89ebc025b02d8c38893"
              }
            },
            "name": "Ichinose, Kana"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 41966,
            "url": "https://myanimelist.net/people/41966/Jill_Harris",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/43821.jpg?s=8610b4cfc43832af5a4693ba65aea62d"
              }
            },
            "name": "Harris, Jill"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 69039,
            "url": "https://myanimelist.net/people/69039/Jehanne_Thellier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Thellier, Jehanne"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 55789,
            "url": "https://myanimelist.net/people/55789/Maria_Clara_Rosis",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/81553.jpg?s=1e4b444a732541012720830c126011f3"
              }
            },
            "name": "Rosis, Maria Clara"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 42650,
            "url": "https://myanimelist.net/people/42650/Agnese_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/46013.jpg?s=f6c96bb2fa5bc12ca95ddbaa89084311"
              }
            },
            "name": "Marteddu, Agnese"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 63795,
            "url": "https://myanimelist.net/people/63795/Azucena_Estrada",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/73695.jpg?s=40f919e6402c7748e196e320bdfc1d7b"
              }
            },
            "name": "Estrada, Azucena"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 37649,
            "url": "https://myanimelist.net/people/37649/Linda_Fölster",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/39598.jpg?s=4763fb1111ff7ad2700f2dc77e4b6c77"
              }
            },
            "name": "Fölster, Linda"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 184947,
        "url": "https://myanimelist.net/character/184947/Frieren",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.jpg?s=1706604ec2ca141a172526b8dedf3177"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.webp?s=1706604ec2ca141a172526b8dedf3177",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105t.webp?s=1706604ec2ca141a172526b8dedf3177"
          }
        },
        "name": "Frieren"
      },
      "role": "Main",
      "favorites": 19304,
      "voice_actors": [
        {
          "person": {
            "mal_id": 17215,
            "url": "https://myanimelist.net/people/17215/Atsumi_Tanezaki",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/77190.jpg?s=ed33c5d429051864f3af3fe2e64eb970"
              }
            },
            "name": "Tanezaki, Atsumi"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 35117,
            "url": "https://myanimelist.net/people/35117/Mallorie_Rodak",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40976.jpg?s=5a1f44329cebb84e57d015299e4c7f6c"
              }
            },
            "name": "Rodak, Mallorie"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 21893,
            "url": "https://myanimelist.net/people/21893/Marie_Nonnenmacher",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71214.jpg?s=b5e5e78b6b436cb9fdb6cbbb6cf681bc"
              }
            },
            "name": "Nonnenmacher, Marie"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 53037,
            "url": "https://myanimelist.net/people/53037/Jacque_Souza",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/77023.jpg?s=6adb2b1bd856b67e7411e9bb5e203845"
              }
            },
            "name": "Souza, Jacque"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 35767,
            "url": "https://myanimelist.net/people/35767/Martina_Felli",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/74407.jpg?s=9bf923e68823fbb869f633484f5dab86"
              }
            },
            "name": "Felli, Martina"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 56690,
            "url": "https://myanimelist.net/people/56690/Erika_Ugalde",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71299.jpg?s=799f4d3249ec390ef3c3117113095efd"
              }
            },
            "name": "Ugalde, Erika"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 40043,
            "url": "https://myanimelist.net/people/40043/Julia_Casper",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40335.jpg?s=b01c2b7858aa1d326cce91eec0d34cc0"
              }
            },
            "name": "Casper, Julia"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188177,
        "url": "https://myanimelist.net/character/188177/Stark",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.jpg?s=ea781ce6864ae29a56f5ce3d223d9496"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292.webp?s=ea781ce6864ae29a56f5ce3d223d9496",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/2/523292t.webp?s=ea781ce6864ae29a56f5ce3d223d9496"
          }
        },
        "name": "Stark"
      },
      "role": "Main",
      "favorites": 1757,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47439,
            "url": "https://myanimelist.net/people/47439/Chiaki_Kobayashi",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/66505.jpg?s=b8e3db933b88d9d18dd0646526d46973"
              }
            },
            "name": "Kobayashi, Chiaki"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 47046,
            "url": "https://myanimelist.net/people/47046/Jordan_Dash_Cruz",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/50962.jpg?s=87cea43b9567d828fdfdb015a85c7b5d"
              }
            },
            "name": "Cruz, Jordan Dash"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 20100,
            "url": "https://myanimelist.net/people/20100/Arisa_Kiyoto",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/54017.jpg?s=16c30b0399a3c263687fa263befe7be0"
              }
            },
            "name": "Kiyoto, Arisa"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 56907,
            "url": "https://myanimelist.net/people/56907/Lucas_Miagusuku",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/77705.jpg?s=a66b69ddc1b52afc9206cac31520f138"
              }
            },
            "name": "Miagusuku, Lucas"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 1613,
            "url": "https://myanimelist.net/people/1613/Brigitte_Lecordier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/67476.jpg?s=ff50105bede34513c44198b231e6e6b1"
              }
            },
            "name": "Lecordier, Brigitte"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 42908,
            "url": "https://myanimelist.net/people/42908/Tito_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/46474.jpg?s=c7724464c1d9a85235ce3d76f4db0613"
              }
            },
            "name": "Marteddu, Tito"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 62748,
            "url":
                "https://myanimelist.net/people/62748/Eduardo_Martínez_Torizes",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/73055.jpg?s=33e5d25725c98b2192077050462fb849"
              }
            },
            "name": "Martínez Torizes, Eduardo"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 414,
            "url": "https://myanimelist.net/people/414/Brittney_Karbowski",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/34809.jpg?s=1c3379b3322880262fca475d33982d5a"
              }
            },
            "name": "Karbowski, Brittney"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 45755,
            "url": "https://myanimelist.net/people/45755/Kelyan_Blanc",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/81432.jpg?s=e30e31911d53c953f94645d90b506e17"
              }
            },
            "name": "Blanc, Kelyan"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 63072,
            "url": "https://myanimelist.net/people/63072/Janek_Schächter",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Schächter, Janek"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 188176,
        "url": "https://myanimelist.net/character/188176/Fern",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.jpg?s=b280b410b588ebcd3fd30ac6fad02978"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083.webp?s=b280b410b588ebcd3fd30ac6fad02978",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/13/519083t.webp?s=b280b410b588ebcd3fd30ac6fad02978"
          }
        },
        "name": "Fern"
      },
      "role": "Main",
      "favorites": 3375,
      "voice_actors": [
        {
          "person": {
            "mal_id": 47097,
            "url": "https://myanimelist.net/people/47097/Kana_Ichinose",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/70398.jpg?s=01ab90c96ed2a89ebc025b02d8c38893"
              }
            },
            "name": "Ichinose, Kana"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 41966,
            "url": "https://myanimelist.net/people/41966/Jill_Harris",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/43821.jpg?s=8610b4cfc43832af5a4693ba65aea62d"
              }
            },
            "name": "Harris, Jill"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 69039,
            "url": "https://myanimelist.net/people/69039/Jehanne_Thellier",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c"
              }
            },
            "name": "Thellier, Jehanne"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 55789,
            "url": "https://myanimelist.net/people/55789/Maria_Clara_Rosis",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/81553.jpg?s=1e4b444a732541012720830c126011f3"
              }
            },
            "name": "Rosis, Maria Clara"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 42650,
            "url": "https://myanimelist.net/people/42650/Agnese_Marteddu",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/46013.jpg?s=f6c96bb2fa5bc12ca95ddbaa89084311"
              }
            },
            "name": "Marteddu, Agnese"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 63795,
            "url": "https://myanimelist.net/people/63795/Azucena_Estrada",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/73695.jpg?s=40f919e6402c7748e196e320bdfc1d7b"
              }
            },
            "name": "Estrada, Azucena"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 37649,
            "url": "https://myanimelist.net/people/37649/Linda_Fölster",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/39598.jpg?s=4763fb1111ff7ad2700f2dc77e4b6c77"
              }
            },
            "name": "Fölster, Linda"
          },
          "language": "German"
        }
      ]
    },
    {
      "character": {
        "mal_id": 184947,
        "url": "https://myanimelist.net/character/184947/Frieren",
        "images": {
          "jpg": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.jpg?s=1706604ec2ca141a172526b8dedf3177"
          },
          "webp": {
            "image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105.webp?s=1706604ec2ca141a172526b8dedf3177",
            "small_image_url":
                "https://cdn.myanimelist.net/images/characters/7/525105t.webp?s=1706604ec2ca141a172526b8dedf3177"
          }
        },
        "name": "Frieren"
      },
      "role": "Main",
      "favorites": 19304,
      "voice_actors": [
        {
          "person": {
            "mal_id": 17215,
            "url": "https://myanimelist.net/people/17215/Atsumi_Tanezaki",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/77190.jpg?s=ed33c5d429051864f3af3fe2e64eb970"
              }
            },
            "name": "Tanezaki, Atsumi"
          },
          "language": "Japanese"
        },
        {
          "person": {
            "mal_id": 35117,
            "url": "https://myanimelist.net/people/35117/Mallorie_Rodak",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40976.jpg?s=5a1f44329cebb84e57d015299e4c7f6c"
              }
            },
            "name": "Rodak, Mallorie"
          },
          "language": "English"
        },
        {
          "person": {
            "mal_id": 21893,
            "url": "https://myanimelist.net/people/21893/Marie_Nonnenmacher",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71214.jpg?s=b5e5e78b6b436cb9fdb6cbbb6cf681bc"
              }
            },
            "name": "Nonnenmacher, Marie"
          },
          "language": "French"
        },
        {
          "person": {
            "mal_id": 53037,
            "url": "https://myanimelist.net/people/53037/Jacque_Souza",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/1/77023.jpg?s=6adb2b1bd856b67e7411e9bb5e203845"
              }
            },
            "name": "Souza, Jacque"
          },
          "language": "Portuguese (BR)"
        },
        {
          "person": {
            "mal_id": 35767,
            "url": "https://myanimelist.net/people/35767/Martina_Felli",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/74407.jpg?s=9bf923e68823fbb869f633484f5dab86"
              }
            },
            "name": "Felli, Martina"
          },
          "language": "Italian"
        },
        {
          "person": {
            "mal_id": 56690,
            "url": "https://myanimelist.net/people/56690/Erika_Ugalde",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/3/71299.jpg?s=799f4d3249ec390ef3c3117113095efd"
              }
            },
            "name": "Ugalde, Erika"
          },
          "language": "Spanish"
        },
        {
          "person": {
            "mal_id": 40043,
            "url": "https://myanimelist.net/people/40043/Julia_Casper",
            "images": {
              "jpg": {
                "image_url":
                    "https://cdn.myanimelist.net/images/voiceactors/2/40335.jpg?s=b01c2b7858aa1d326cce91eec0d34cc0"
              }
            },
            "name": "Casper, Julia"
          },
          "language": "German"
        }
      ]
    },
  ];
  @override
  void initState() {
    limitedSynopsis =
        widget.synopsis != null ? widget.synopsis!.substring(0, 200) : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImage(),
                buildTitle(),
                buildScoreEpisodes(),
                buildGenres(),
                buildSynopsis(),
                buildCharcterList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGenres() {
    return SizedBox(
      width: context.calculateWidth(1),
      height: context.calculateHeight(16),
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.genres?.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                padding: const EdgeInsets.all(5),
                child: Text(widget.genres?[index]['name']),
              );
            }),
      ),
    );
  }

  Widget buildSynopsis() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Text(
            widget.synopsis!,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          InkWell(
            child: Text(
              maxLines == 3 ? 'Show More...' : 'Show Less...',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              setState(() {
                maxLines = maxLines == 3 ? 100 : 3;
              });
            },
          )
        ],
      ),
    );
  }

  Padding buildScoreEpisodes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildScore(),
          Text(
            'Episodes: ${widget.episodesCount}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Hero(
      tag: widget.id,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 10),
        height: context.calculateHeight(4),
        width: context.calculateWidth(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
          image: DecorationImage(
            image: CachedNetworkImageProvider(widget.imageUrl!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AutoSizeText buildTitle() {
    return AutoSizeText(
      widget.title ?? '',
      maxLines: 2,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Row buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '${widget.ratingScore} / 10',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  buildCharcterList() {
    return Column(
      children: [
        const Divider(
          color: Colors.blueGrey,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Characters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: context.calculateHeight(2),
          width: context.calculateWidth(1),
          child: GridView.builder(
            primary: true,
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: CachedNetworkImageProvider(
                      data[index]['character']['images']['jpg']['image_url'],
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  AutoSizeText(
                    data[index]['character']['name'],
                    maxFontSize: 15,
                    minFontSize: 10,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
