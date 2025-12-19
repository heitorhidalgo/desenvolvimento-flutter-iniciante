import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/core/default_dialog_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/pessoa_controller.dart';
import '../../routes/routes.dart';

class PessoaDialog extends StatelessWidget {
  final Pessoa pessoa;

  const PessoaDialog({
    super.key,
    required this.pessoa,
  });

  @override
  Widget build(BuildContext context) {
    final pessoaController = GetIt.instance<PessoaController>();
    return AlertDialog(
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async {
                await pessoaController.removerPessoa(pessoa);
                if(context.mounted) Navigator.of(context).pop();
              },
              child: Text(
                "Excluir",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () async {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Routes.criarPessoaPage, arguments: {
                  "pessoa": pessoa,
                });
                // await pessoaController.removerPessoa(pessoa);
                // if(context.mounted) Navigator.of(context).pop();
              },
              child: Text(
                "Editar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Fechar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informações do usuário"),
            SizedBox(height: 8),
            DefaultDialogContainer(
              child: Text("Id: ${pessoa.id}"),
            ),
            DefaultDialogContainer(
              child: Text("Nome: ${pessoa.nome}"),
            ),
            DefaultDialogContainer(
              child: Text("Peso: ${pessoa.peso.paraPeso()}"),
            ),
            DefaultDialogContainer(
              child: Text("altura: ${pessoa.altura.paraAltura()}"),
            ),
          ],
        ),
      ),
    );
  }
}