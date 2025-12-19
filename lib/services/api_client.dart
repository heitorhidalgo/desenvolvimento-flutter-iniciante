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
          .map(
            (pessoasJson) => Pessoa(
              id: pessoasJson["id"],
              nome: pessoasJson["nome"],
              altura: pessoasJson["altura"],
              peso: pessoasJson["peso"],
            ),
          )
          .toList();
    }
    throw Exception("Ocorreu um erro ao buscar pessoas");
  }
}
