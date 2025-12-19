import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../pages/home_page.dart';
import '../pages/criar_pessoa_page.dart';
import '../routes/routes.dart';

Map<String, WidgetBuilder> routes = {
  Routes.intialRoute: (context) => const HomePage(),

  Routes.criarPessoaPage: (context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    Pessoa? pessoaSelecionada;

    if (args is Pessoa) {
      pessoaSelecionada = args;
    } else if (args is Map<String, dynamic>) {
      pessoaSelecionada = args['pessoa'] as Pessoa?;
    }

    return CriarPessoaPage(
      pessoa: pessoaSelecionada,
    );
  },
};