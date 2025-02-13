import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends ConsumerState<CategoryView> {

    bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if(isLoading || isLastPage) return;
    isLoading = true;
    await ref.read(popularMoviesProvider.notifier).loadNextPage();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();

    final popularMovies = ref.watch(popularMoviesProvider);

   return Scaffold(
        body: MoviesMasonry(
          loadNextPage: loadNextPage,
          movies: popularMovies)
    );
  }
  
  
}