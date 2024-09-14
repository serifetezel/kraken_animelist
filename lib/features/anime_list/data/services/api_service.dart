import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: '/top/anime')
  Future<Response> getAnimeList(
    @Query("page") int page,
    @Query("limit") int limit,
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
