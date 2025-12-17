import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../widgets/lista_pessoas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados dos usuários"),
      ),
      body: ListaPessoas(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: (){
          context.pushNamed(Routes.novaPagina);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
