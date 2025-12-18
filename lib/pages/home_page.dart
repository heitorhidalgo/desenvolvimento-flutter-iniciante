import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../routes/routes.dart';
import '../widgets/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();

  @override
  void initState() {
    pessoaController.addListener((){
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados dos usuários"),
      ),
      body: ListaPessoas(
        pessoas: pessoaController.pessoas,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed(Routes.criarPessoaPage);
          if(result != null){
            final pessoaDto = result as CriarPessoaDto;
            pessoaController.adicionarPessoa(pessoaDto);

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
