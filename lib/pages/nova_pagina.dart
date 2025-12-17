import 'package:flutter/material.dart';

class NovaPagina extends StatelessWidget {
  const NovaPagina ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Nova Página"),
    ),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.of(context).pop();
      }, child: Text("Voltar"),
      ),
      ),
    );
  }
}
