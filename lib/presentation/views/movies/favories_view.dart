import 'package:flutter/material.dart';

class FavoriesView extends StatelessWidget {
  const FavoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        ),
        body: const Center(
          child: Text('Favoritos'),
        ),
    );
  }
}