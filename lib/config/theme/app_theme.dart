import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff2862F5),
      brightness: Brightness.dark, // Forzar modo oscuro
    ),
  );
}
