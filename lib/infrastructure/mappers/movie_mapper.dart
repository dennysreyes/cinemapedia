import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
        adult: movieDB.adult,
        backdropPath: (movieDB.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : 'https://privateflite.com/assets/global/img/image-not-found-dark.png',
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: (movieDB.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : 'https://privateflite.com/assets/global/img/image-not-found-dark.png',
        releaseDate: (movieDB.releaseDate != null)
            ? movieDB.releaseDate!
            : DateTime.now(),
        title: movieDB.title,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
        adult: movieDetails.adult,
        backdropPath: (movieDetails.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
            : 'https://privateflite.com/assets/global/img/image-not-found-dark.png',
        genreIds: movieDetails.genres.map((e) => e.name).toList(),
        id: movieDetails.id,
        originalLanguage: movieDetails.originalLanguage,
        originalTitle: movieDetails.originalTitle,
        overview: movieDetails.overview,
        popularity: movieDetails.popularity,
        posterPath: (movieDetails.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
            : 'https://privateflite.com/assets/global/img/image-not-found-dark.png',
        releaseDate: movieDetails.releaseDate,
        title: movieDetails.title,
        video: movieDetails.video,
        voteAverage: movieDetails.voteAverage,
        voteCount: movieDetails.voteCount,
      );
}
