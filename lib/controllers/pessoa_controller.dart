import 'package:flutter/material.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/states/messages_state.dart';
import '../models/pessoa.dart';
import '../services/api_client.dart';

class PessoaController extends ChangeNotifier {
  final ApiClient apiClient;

  PessoaController({required this.apiClient});

  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  bool _loading = false;
  bool get loading => _loading;

  final ValueNotifier<MessagesStates> mensagemNotifier = ValueNotifier(
    IdleMessage(),
  );

  Future<void> listarPessoas() async {
    _setLoading(true);

    try {
      final resultado = await apiClient.get();
      _pessoas = resultado;
    } catch (e) {
      debugPrint('Erro ao listar pessoas: $e');
      mensagemNotifier.value = ErrorMessage(
        message: "Ocorreu um erro ao buscar os dados.",
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> adicionarPessoa(CriarPessoaDto criarPessoa) async {
    _setLoading(true);

    try {
      final novaPessoa = await apiClient.post(criarPessoa);

      _pessoas.add(novaPessoa);

      mensagemNotifier.value = SuccessMessage(
        message: "Pessoa adicionada com sucesso.",
      );
    } catch (e) {
      debugPrint('Erro ao adicionar pessoa: $e');
      mensagemNotifier.value = ErrorMessage(
        message: "Erro ao adicionar pessoa. Tente novamente.",
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> atualizarPessoa(Pessoa pessoaAtualizada) async {
    _setLoading(true);

    try {
      await apiClient.put(pessoaAtualizada);

      final index = _pessoas.indexWhere((e) => e.id == pessoaAtualizada.id);

      if (index != -1) {
        _pessoas[index] = pessoaAtualizada;
        mensagemNotifier.value = SuccessMessage(
          message: "Pessoa atualizada com sucesso.",
        );
      } else {
        listarPessoas();
      }
    } catch (e) {
      debugPrint('Erro ao atualizar pessoa: $e');
      mensagemNotifier.value = ErrorMessage(
        message: "Erro ao atualizar os dados.",
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> removerPessoa(Pessoa pessoa) async {
    _setLoading(true);

    try {
      await apiClient.delete(pessoa);

      _pessoas.remove(pessoa);

      mensagemNotifier.value = SuccessMessage(
        message: "Pessoa removida com sucesso.",
      );
    } catch (e) {
      debugPrint('Erro ao remover pessoa: $e');
      mensagemNotifier.value = ErrorMessage(
        message: "Não foi possível remover esta pessoa.",
      );
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}