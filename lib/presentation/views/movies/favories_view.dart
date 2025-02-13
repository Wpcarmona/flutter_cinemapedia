import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoriesView extends ConsumerStatefulWidget {
  const FavoriesView({super.key});

  @override
  FavoriesViewState createState() => FavoriesViewState();
}

class FavoriesViewState extends ConsumerState<FavoriesView> {

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
    final newMovies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if(newMovies.isEmpty) isLastPage = true;
  }

  @override
  Widget build(BuildContext context) {

    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_creation_outlined,
              color: colors.primary,
              size: 100,
            ),
            const Text('Ohhh noooo!!', style: TextStyle(fontSize: 30,),),
            const Text('No tienes peliculas favoritas', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'), 
              child: const Text('Explorar')),
          ],
        ),
      );
    }
    return Scaffold(
        body: MoviesMasonry(
          loadNextPage: loadNextPage,
          movies: favoriteMovies)
    );
  }
}