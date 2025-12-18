import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../routes/routes.dart';
import '../widgets/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pessoa> pessoas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados dos usuários"),
      ),
      body: ListaPessoas(
        pessoas: pessoas,
        onDeletePessoa: (pessoa) {
          pessoas.remove(pessoa);
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed(Routes.criarPessoaPage);
          if(result != null){
            final pessoaDto = result as CriarPessoaDto;

            final pessoa = Pessoa(
              id: pessoas.length + 1,
              nome: pessoaDto.nome,
              altura: pessoaDto.altura,
              peso: pessoaDto.peso,
            );
            pessoas.add(pessoa);
            setState(() {});
          }
          print("resultado: $result");
          //context.pushNamed(Routes.criarPessoaPage);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
