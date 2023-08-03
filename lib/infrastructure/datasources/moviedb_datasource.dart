import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesdbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'en-EN'
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((element) => element.posterPath != 'no')
        .map(
          (e) => MovieMapper.movieDBToEntity(e),
        )
        .toList();

    return movies;
  }
}
