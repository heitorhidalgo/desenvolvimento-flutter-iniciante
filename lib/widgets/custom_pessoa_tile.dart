import 'package:desenvolvimento_flutter_iniciante/widgets/custom_tile.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa_dialog.dart';
import 'package:flutter/material.dart';
import '../models/pessoa.dart';

class CustomPessoaTile extends StatelessWidget {
  final Pessoa pessoa;
  const CustomPessoaTile({super.key,
    required this.pessoa
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return PessoaDialog(
                pessoa: pessoa,
            );
          },
        );
      },
      color: Colors.white70,
      leading: Text("Id: ${pessoa.id}"),
      title: Text(
        pessoa.nome,
        style: TextStyle(fontSize: 20),
      ),
      subTitle: Text("Peso: ${pessoa.peso.toStringAsFixed(1)} kg"),
      trailing: Text("Altura: ${pessoa.altura} cm"));
  }
}
