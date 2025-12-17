import 'package:desenvolvimento_flutter_iniciante/widgets/listview_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.white70),
            titleMedium: TextStyle(color: Colors.black, fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Meu primeiro App.")),
        body: ListaPessoa()
      ),
    );
  }
}