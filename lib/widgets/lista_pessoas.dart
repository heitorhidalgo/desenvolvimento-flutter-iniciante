import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/pessoa_controller.dart';
import '../models/pessoa.dart';
import '../routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';

class ListaPessoas extends StatelessWidget {
  final List<Pessoa> pessoas;

  const ListaPessoas({
    super.key,
    required this.pessoas,
  });

  @override
  Widget build(BuildContext context) {
    if (pessoas.isEmpty) {
      return const Center(
        child: Text("Nenhuma pessoa cadastrada!"),
      );
    }

    final controller = GetIt.I<PessoaController>();

    return ListView.separated(
      itemCount: pessoas.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final pessoa = pessoas[index];

        return Dismissible(
          key: ValueKey(pessoa.id),
          direction: DismissDirection.endToStart,

          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),

          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Tem certeza?"),
                content: Text("Deseja remover ${pessoa.nome}?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    child: const Text("Excluir", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },

          onDismissed: (direction) {
            controller.removerPessoa(pessoa);
          },

          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                pessoa.nome.isNotEmpty ? pessoa.nome[0].toUpperCase() : "?",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              pessoa.nome,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${pessoa.peso.paraPeso()} | ${pessoa.altura.paraAltura()}",
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),

            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.criarPessoaPage,
                arguments: pessoa,
              );
            },
          ),
        );
      },
    );
  }
}