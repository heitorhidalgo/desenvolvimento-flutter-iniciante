import 'package:desenvolvimento_flutter_iniciante/routes/router.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = GetIt.instance<ThemeController>();
    return ListenableBuilder(
        listenable: themeController,
        builder: (context, child){
        return MaterialApp(
          initialRoute: Routes.intialRoute,
          routes: routes,
          title: 'Flutter Demo',
          theme: themeController.darkTheme == false ? lightTheme : darkTheme,
        );
      }
    );
  }
}