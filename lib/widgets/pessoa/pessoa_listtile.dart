import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaListTile extends StatefulWidget {
  final Pessoa pessoa;
  const PessoaListTile({
    super.key,
    required this.pessoa,
  });

  @override
  State<PessoaListTile> createState() => _PessoaListTileState();
}

class _PessoaListTileState extends State<PessoaListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: ListTile(
        leading: Text("Id: ${widget.pessoa.id}"),
        title: Text("Nome: ${widget.pessoa.nome}"),
        subtitle: Text("Peso: ${widget.pessoa.peso.paraPeso()}"),
        trailing: Text("Altura: ${widget.pessoa.altura.paraAltura()}"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}