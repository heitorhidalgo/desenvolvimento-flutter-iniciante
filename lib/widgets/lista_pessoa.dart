import 'package:desenvolvimento_flutter_iniciante/mock/gerar_pessoas.dart';
import 'package:flutter/material.dart';

import 'custom_pessoa_tile.dart';

class ListaPessoa extends StatelessWidget {
  const ListaPessoa({super.key});

  @override
  Widget build(BuildContext context) {
    final pessoa = gerarPessoa(20);

    return ListView.builder(
      itemCount: pessoa.length,
      itemBuilder: (context, index) {
        return CustomPessoaTile(pessoa: pessoa[index]);
      },
    );
  }
}