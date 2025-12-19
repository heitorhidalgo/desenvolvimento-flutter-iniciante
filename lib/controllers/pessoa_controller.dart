import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/states/messages_state.dart';
import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../services/api_client.dart';

class PessoaController extends ChangeNotifier {
  List<Pessoa> _pessoas = [];

  List<Pessoa> get pessoas => _pessoas;

  final apiClient = ApiClient();

  ValueNotifier<MessagesStates> mensagemNotifier = ValueNotifier(
    IddleMessage(),
  );

  bool _loading = false;

  bool get loading => _loading;

  void listarPessoas() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(milliseconds: 1));
      final pessoas = await apiClient.get();

      _pessoas = pessoas;
    } on Exception catch (error) {} finally {
      _loading = false;
      notifyListeners();
    }
  }

 Future <void> adicionarPessoa(CriarPessoaDto criarPessoa) async {
    try {
      final pessoa = await apiClient.post(criarPessoa);

      _pessoas.add(pessoa);
      mensagemNotifier.value = SuccessMessage(
        message: "Pessoa adicionada com sucesso.",
      );
      notifyListeners();
    } on Exception {
      mensagemNotifier.value = ErrorMessage(
        message: "Ocorreu um erro ao adicionar pessoa",
      );
    }
  }

  Future  atualizarPessoa(Pessoa criarPessoa) async {
    try {
      final pessoa = await apiClient.put(criarPessoa);

      final pessoaIndex = _pessoas.indexWhere((e) => e.id == pessoa.id);

      _pessoas[pessoaIndex] = pessoa;

      mensagemNotifier.value = SuccessMessage(
        message: "Pessoa atualizada com sucesso.",
      );
    } on Exception catch(error) {
      mensagemNotifier.value = ErrorMessage(
        message: "Ocorreu um erro ao atualizar pessoa",
      );
    }finally{
      notifyListeners();
    }
  }

  Future<void> removerPessoa(Pessoa pessoa) async {
    try {
      await apiClient.delete(pessoa);

      _pessoas.remove(pessoa);
      mensagemNotifier.value = SuccessMessage(
        message: "Pessoa removida com sucesso.",
      );
    } on Exception catch (error) {} finally {
      notifyListeners();
    }
  }
}