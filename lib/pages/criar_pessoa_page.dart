import 'package:flutter/material.dart';

import '../models/criar_pessoa_dto.dart';

class CriarPessoaPage extends StatefulWidget {
  const CriarPessoaPage ({super.key});

  @override
  State<CriarPessoaPage> createState() => _CriarPessoaPageState();
}

class _CriarPessoaPageState extends State<CriarPessoaPage> {
  final gap = SizedBox(height: 16);
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text("Nova Página"),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o nome!";
                  }
                  final nomeCompleto = value!.split(" ");

                  if(nomeCompleto.length < 2){
                    return "Por favor, preencha o nome completo!";
                  }
                  return null;
                },
                controller: nomeController,
                decoration: InputDecoration(
                  label: Text("Nome"),
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o peso!";
                  }
                  return null;
                },
                controller: pesoController,
                decoration: InputDecoration(
                  label: Text("Peso"),
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha a altura!";
                  }
                  return null;
                },
                controller: alturaController,
                decoration: InputDecoration(
                  label: Text("Altura"),
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState?.validate() == true){
                          final CriarPessoa = CriarPessoaDto(
                              nome: nomeController.text,
                              altura: int.parse(alturaController.text),
                              peso: double.parse(pesoController.text),
                          );
                        }
                      },
                      child: Text("Salvar"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
