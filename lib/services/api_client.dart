import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:dio/dio.dart';
import '../models/pessoa.dart';

class ApiClient {
  final Dio dio;
  final String apiUrl;

  static const String _endpoint = '/pessoas';

  ApiClient({
    required this.dio,
    required this.apiUrl,
  });

  Future<List<Pessoa>> get() async {
    try {
      final response = await dio.get("$apiUrl$_endpoint");

      final data = response.data;

      if (data is List) {
        return data.map((item) => Pessoa.fromJson(item)).toList();
      } else {
        throw Exception("Formato de dados inválido: Esperava uma lista.");
      }
    } on DioException catch (e) {
      throw _tratarErroDio(e, "buscar pessoas");
    }
  }

  Future<Pessoa> post(CriarPessoaDto criarPessoa) async {
    try {
      final response = await dio.post(
        "$apiUrl$_endpoint",
        data: criarPessoa.toJson(),
      );

      return Pessoa.fromJson(response.data);
    } on DioException catch (e) {
      throw _tratarErroDio(e, "adicionar pessoa");
    }
  }

  Future<void> delete(Pessoa pessoa) async {
    try {
      await dio.delete("$apiUrl$_endpoint/${pessoa.id}");
    } on DioException catch (e) {
      throw _tratarErroDio(e, "remover pessoa");
    }
  }

  Future<void> put(Pessoa pessoa) async {
    try {
      await dio.put(
        "$apiUrl$_endpoint/${pessoa.id}",
        data: pessoa.toJson(),
      );
    } on DioException catch (e) {
      throw _tratarErroDio(e, "atualizar pessoa");
    }
  }

  Exception _tratarErroDio(DioException e, String acao) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception("Tempo limite excedido ao $acao. Verifique sua conexão.");
    }

    if (e.type == DioExceptionType.connectionError) {
      return Exception("Sem conexão com a internet.");
    }

    if (e.response != null) {
      return Exception("Erro ${e.response?.statusCode} ao $acao: ${e.response?.statusMessage}");
    }

    return Exception("Erro desconhecido ao $acao: ${e.message}");
  }
}