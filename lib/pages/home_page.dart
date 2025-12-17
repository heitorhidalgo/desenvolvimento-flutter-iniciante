import 'package:desenvolvimento_flutter_iniciante/pages/nova_pagina.dart';
import 'package:flutter/material.dart';
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
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) {
                return NovaPagina();
              },
          ),
              (route) => false,
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
