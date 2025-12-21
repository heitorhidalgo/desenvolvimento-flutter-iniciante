import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/theme_controller.dart';
import '../routes/routes.dart';
import '../states/messages_state.dart';
import '../widgets/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    super.initState();
    pessoaController.listarPessoas();

    themeController.mensagemNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);
  }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.mensagemNotifier.removeListener(_onThemeMensagem);
    super.dispose();
  }

  void _onPessoaMensagem() {
    _tratarMensagem(pessoaController.mensagemNotifier.value);
  }

  void _onThemeMensagem() {
    _tratarMensagem(themeController.mensagemNotifier.value);
  }

  void _tratarMensagem(dynamic value) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).clearSnackBars();

    if (value is SuccessMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(value.message),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (value is ErrorMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(value.message),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: themeController,
              builder: (context, child) {
                return Switch(
                  value: themeController.darkTheme,
                  onChanged: (value) {
                    themeController.toggleTheme(value);
                  },
                );
              },
            ),
            const Text("Tema escuro"),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Dados dos usuários"),
        actions: [
          IconButton(
            onPressed: () => pessoaController.listarPessoas(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: ListenableBuilder(
        listenable: pessoaController,
        builder: (context, child) {
          if (pessoaController.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (pessoaController.pessoas.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.list_alt, size: 60, color: Colors.grey),
                  const SizedBox(height: 10),
                  const Text("Nenhum usuário encontrado."),
                  TextButton(
                      onPressed: () => pessoaController.listarPessoas(),
                      child: const Text("Tentar novamente")
                  )
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await pessoaController.listarPessoas();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListaPessoas(pessoas: pessoaController.pessoas),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          await Navigator.of(context).pushNamed(Routes.criarPessoaPage);
          pessoaController.listarPessoas();
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }
}