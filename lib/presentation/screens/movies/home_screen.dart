import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _HomeView(), bottomNavigationBar: CustomBottomNavigationBar());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();

    
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();

    
    final moviesNowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);


    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true, 
          snap: true, 
          pinned: false,
          elevation: 0, 
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin, 
            titlePadding: EdgeInsets.zero, 
            title: CustomAppbar(),
          ),
        ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              
              MoviesSlideShow(movies: nowPlayingMovies),
              MovieHorizontalListview(
                movies: moviesNowPlayingMovies,
                title: 'En cines',
                subtitle: 'Lunes 27',
                loadNexPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Proximamente',
                subtitle: 'En este mes',
                loadNexPage: () {
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                loadNexPage: () {
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor calificadas',
                subtitle: 'Desde siempre',
                loadNexPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        },
        childCount: 1,
      )),
    ]);
  }
}
