import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../controllers/pessoa_controller.dart';
import '../models/criar_pessoa_dto.dart';
import '../models/pessoa.dart';

class CriarPessoaPage extends StatefulWidget {
  final Pessoa? pessoa;

  const CriarPessoaPage({
    super.key,
    this.pessoa,
  });

  @override
  State<CriarPessoaPage> createState() => _CriarPessoaPageState();
}

class _CriarPessoaPageState extends State<CriarPessoaPage> {
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final pessoaController = GetIt.instance<PessoaController>();

  bool get isEditing => widget.pessoa != null;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      final p = widget.pessoa!;
      nomeController.text = p.nome;
      pesoController.text = p.peso.toString().replaceAll(".", ",");
      alturaController.text = p.altura.toString();
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (!formKey.currentState!.validate()) return;

    final pesoFormatado = double.tryParse(pesoController.text.replaceAll(",", "."));
    final alturaFormatada = int.tryParse(alturaController.text);

    if (pesoFormatado == null || alturaFormatada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Verifique os números digitados.")),
      );
      return;
    }

    if (!isEditing) {
      final dto = CriarPessoaDto(
        nome: nomeController.text.trim(),
        altura: alturaFormatada,
        peso: pesoFormatado,
      );
      await pessoaController.adicionarPessoa(dto);
    } else {
      final pessoaAtualizada = widget.pessoa!.copyWith(
        nome: nomeController.text.trim(),
        altura: alturaFormatada,
        peso: pesoFormatado,
      );
      await pessoaController.atualizarPessoa(pessoaAtualizada);
    }

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 16);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Editar Pessoa" : "Nova Pessoa"),
      ),
      body: ListenableBuilder(
        listenable: pessoaController,
        builder: (context, child) {
          return AbsorbPointer(
            absorbing: pessoaController.loading,
            child: child,
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nomeController,
                  textCapitalization: TextCapitalization.words, // João Da Silva
                  textInputAction: TextInputAction.next, // Botão "Próximo"
                  decoration: const InputDecoration(
                    labelText: "Nome Completo",
                    prefixIcon: Icon(Icons.person),
                    hintText: "Ex: João Guilherme",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Por favor, preencha o nome.";
                    }
                    if (value.trim().split(" ").length < 2) {
                      return "Informe nome e sobrenome.";
                    }
                    return null;
                  },
                ),
                gap,

                TextFormField(
                  controller: pesoController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Peso (Kg)",
                    prefixIcon: Icon(Icons.monitor_weight),
                    suffixText: "Kg",
                    hintText: "Ex: 70,5",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Campo obrigatório";
                    return null;
                  },
                ),
                gap,

                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done, // Botão "OK" fecha teclado
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    prefixIcon: Icon(Icons.height),
                    suffixText: "cm",
                    hintText: "Ex: 180",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Campo obrigatório";
                    return null;
                  },
                  onFieldSubmitted: (_) => _salvar(),
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ListenableBuilder(
                    listenable: pessoaController,
                    builder: (context, _) {
                      if (pessoaController.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ElevatedButton.icon(
                        onPressed: _salvar,
                        icon: const Icon(Icons.save),
                        label: Text(
                          isEditing ? "Atualizar Dados" : "Cadastrar Pessoa",
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}