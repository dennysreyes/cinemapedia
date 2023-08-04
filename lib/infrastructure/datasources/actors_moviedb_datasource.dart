import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMoviedbDataSource extends ActorsDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'en-EN'
    }),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors =
        castResponse.cast.map((e) => ActorMapper.castToEntity(e)).toList();

    return actors;
  }
}
