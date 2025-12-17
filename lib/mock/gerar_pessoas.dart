import 'dart:math';
import 'package:faker/faker.dart';
import '../models/pessoa.dart';

List<Pessoa> gerarPessoa(int quantidade){
  final faker = Faker();
  return List.generate(
    quantidade,
      (index) => Pessoa(id: index,
          nome: faker.person.name(),
          altura: Random().nextInt(200),
          peso: faker.randomGenerator.decimal(min: 50, scale: 50)
      )
  );
}