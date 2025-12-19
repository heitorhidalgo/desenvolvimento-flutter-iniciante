import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:dio/dio.dart';
import '../models/pessoa.dart';

class ApiClient {
  final Dio dio;

  final String apiUrl;

  ApiClient({
    required this.dio,
    required this.apiUrl,
  });

  Future<List<Pessoa>> get() async {
    final request = await dio.get("$apiUrl/pessoas");

    if (request.statusCode == 200) {
      final data = request.data;
      final pessoasJson = data as List;

      return pessoasJson
          .map((pessoasJson) => Pessoa.fromJson(pessoasJson))
          .toList();
    }
    throw Exception("Ocorreu um erro ao buscar pessoas");
  }

  Future<Pessoa> post(CriarPessoaDto criarPessoa) async {
    final request = await dio.post(
      "$apiUrl/pessoas",
      data: criarPessoa.toJson(),
    );

    if (request.statusCode == 201) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception("Ocorreu um erro ao adicionar pessoa");
  }

  Future<void> delete(Pessoa pessoa) async {
    final request = await dio.delete(
      "$apiUrl/pessoas/${pessoa.id}",
    );

    if (request.statusCode == 200) {
      return;
    }
    throw Exception("Ocorreu um erro ao remover pessoa");
  }

  Future<void> put(Pessoa pessoa) async {
    final request = await dio.put(
      "$apiUrl/pessoas/${pessoa.id}",
      data: pessoa.toJson(),
    );

    if (request.statusCode == 200) {
      return;
    }
    throw Exception("Ocorreu um erro ao atualizar pessoa");
  }
}
