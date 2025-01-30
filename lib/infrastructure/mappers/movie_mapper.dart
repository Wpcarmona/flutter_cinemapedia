import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_movidb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://img.freepik.com/vector-gratis/poster-error-404-pagina-no-encontrada-usar-sitio-web_1284-49337.jpg?t=st=1737738935~exp=1737742535~hmac=92d8dbe1a615b560c5c55569fa88bdf2bb9331517ec4160b2f00b5256d109b67&w=996',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetail moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://img.freepik.com/vector-gratis/poster-error-404-pagina-no-encontrada-usar-sitio-web_1284-49337.jpg?t=st=1737738935~exp=1737742535~hmac=92d8dbe1a615b560c5c55569fa88bdf2bb9331517ec4160b2f00b5256d109b67&w=996',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'https://img.freepik.com/vector-gratis/poster-error-404-pagina-no-encontrada-usar-sitio-web_1284-49337.jpg?t=st=1737738935~exp=1737742535~hmac=92d8dbe1a615b560c5c55569fa88bdf2bb9331517ec4160b2f00b5256d109b67&w=996',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
      );
}
