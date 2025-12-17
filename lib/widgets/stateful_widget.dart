import 'package:flutter/material.dart';

class MeuStatefulWidget extends StatefulWidget {
  final void Function() callback;
  const MeuStatefulWidget({super.key,
    required this.callback
  });

  @override
  State<MeuStatefulWidget> createState() => _MeuStatefulWidgetState();
}

class _MeuStatefulWidgetState extends State<MeuStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 16),
        ElevatedButton(
          onPressed: (){
            widget.callback.call();
          },
          child: Text(
            "Botão de baixo",
          ),
        ),
      ],
    );
  }
}