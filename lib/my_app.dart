import 'package:desenvolvimento_flutter_iniciante/routes/router.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controllers/theme_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    super.initState();
    themeController.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Gestão de Pessoas',
          debugShowCheckedModeBanner: false,

          initialRoute: Routes.intialRoute,
          routes: routes,

          theme: lightTheme,

          darkTheme: darkTheme,

          themeMode: themeController.darkTheme ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}