import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:dio/dio.dart';
import '../models/pessoa.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<List<Pessoa>> get() async {
    final request = await dio.get("http://localhost:3000/pessoas");

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
      "http://localhost:3000/pessoas",
      data: criarPessoa.toJson(),
    );

    if (request.statusCode == 201) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception("Ocorreu um erro ao adicionar pessoa");
  }

  Future<void> delete(Pessoa pessoa) async {
    final request = await dio.delete("http://localhost:3000/pessoas/${pessoa.id}");

    if (request.statusCode == 200) {
      return;
    }
    throw Exception("Ocorreu um erro ao remover pessoa");
  }
}
