import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/default_dialog_container.dart';
import 'package:flutter/material.dart';
import '../models/pessoa.dart';

class PessoaDialog extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaDialog({
    super.key,
    required this.pessoa
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultDialogContainer(
              child: Text("Id: ${pessoa.id}"),
            ),
            DefaultDialogContainer(child: Text("Nome: ${pessoa.nome}")),
            DefaultDialogContainer(child: Text("Peso: ${pessoa.peso.paraPeso()}")),
            DefaultDialogContainer(child: Text("Altura: ${pessoa.altura}"))
          ],
        )
      ),
    );
  }
}
