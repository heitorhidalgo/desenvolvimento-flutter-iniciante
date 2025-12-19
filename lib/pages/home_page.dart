import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/theme_controller.dart';
import '../routes/routes.dart';
import '../states/messages_state.dart';
import '../widgets/pessoa/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();
  final ThemeController themeController = GetIt.instance<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: themeController.darkTheme,
              onChanged: (value) {
                themeController.toggleTheme(value);
              },
            ),
            Text("Tema escuro"),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Dados dos usuários")),
      body: ListenableBuilder(
        listenable: pessoaController,
        builder: (context, child) {
          if(pessoaController.loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListaPessoas(pessoas: pessoaController.pessoas);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.criarPessoaPage);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.mensagemNotifier.removeListener(_onThemeMensagem);
    super.dispose();
  }

  @override
  void initState() {
    pessoaController.listarPessoas();
    themeController.mensagemNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);
    super.initState();
  }

  void _onPessoaMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();
    final value = pessoaController.mensagemNotifier.value;

    if (value is SuccessMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text(value.message),
        ),
      );
    } else if (value is ErrorMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(value.message),
        ),
      );
    }
  }

  void _onThemeMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();
    final value = themeController.mensagemNotifier.value;
    if (value is SuccessMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text(value.message),
        ),
      );
    } else if (value is ErrorMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(value.message),
        ),
      );
    }
  }
}
