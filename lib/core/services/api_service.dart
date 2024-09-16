import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: '/top/anime')
  Future<Response> getAnimeList(
    @Query("page") int page, {
    @Query("limit") int limit = 20,
  });

  @Get(path: '/anime/{id}/characters')
  Future<Response> getCharacters(
    @Path("id") int id,
  );

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.jikan.moe/v4'),
      services: [_$ApiService()],
      converter: const JsonConverter(),
    );
    return _$ApiService(client);
  }
}
