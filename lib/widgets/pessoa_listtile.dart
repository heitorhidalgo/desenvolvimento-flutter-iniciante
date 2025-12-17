import 'package:flutter/material.dart';
import '../models/pessoa.dart';

class PessoaListTile extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaListTile({
    super.key,
    required this.pessoa
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: ListTile(
        leading: Text("Id: ${pessoa.id}"),
        title: Text(pessoa.nome),
        subtitle: Text("Peso: ${pessoa.peso} kg"),
        trailing: Text("Altura: ${pessoa.altura} cm"),
      ),
    );
  }
}
