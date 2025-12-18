import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blueGrey))
  ),
);
