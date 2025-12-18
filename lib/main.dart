import 'package:flutter/material.dart';
import 'dependencies/injector.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(const MyApp());
}
