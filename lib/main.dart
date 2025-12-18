import 'package:desenvolvimento_flutter_iniciante/routes/router.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:flutter/material.dart';
import 'dependencies/injector.dart';

void main() {
  injector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.intialRoute,
      routes: routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        textTheme: TextTheme(
          titleSmall: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
          headlineLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}