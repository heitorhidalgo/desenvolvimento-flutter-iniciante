import 'package:flutter/material.dart';

const _seedColor = Colors.blueGrey;

final lightTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.light,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: _seedColor,
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black26,
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _seedColor,
      foregroundColor: Colors.white,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white10,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
);