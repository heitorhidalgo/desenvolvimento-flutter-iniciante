import 'package:faker/faker.dart';
import '../models/pessoa.dart';

List<Pessoa> gerarPessoa(int quantidade){
  final faker = Faker();
  return List.generate(
    quantidade,
      (index) => Pessoa(id: index,
          nome: faker.person.name(),
          altura: faker.randomGenerator.integer(200, min: 150),
          peso: faker.randomGenerator.decimal(min: 50, scale: 50)
      )
  );
}