import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

      final fetchMoreMovie = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(
    fetchMoreMovie: fetchMoreMovie
  );
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

      final fetchMoreMovie = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(
    fetchMoreMovie: fetchMoreMovie
  );
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

      final fetchMoreMovie = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(
    fetchMoreMovie: fetchMoreMovie
  );
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

      final fetchMoreMovie = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(
    fetchMoreMovie: fetchMoreMovie
  );
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovie;

  MoviesNotifier({
    required this.fetchMoreMovie,
  }) : super([]);

  Future<void> loadNextPage() async {
    if(isLoading) return;
    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovie(page: currentPage);
    state = [...state, ...movies];
    isLoading = false;
  }
}
