import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dependencies/injector.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  try {
    await injector();

    runApp(const MyApp());
  } catch (e, stackTrace) {
    debugPrint('Erro fatal na inicialização: $e');
    debugPrint(stackTrace.toString());
  }
}