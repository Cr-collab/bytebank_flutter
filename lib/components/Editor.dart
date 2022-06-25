
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icon;
  const Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(
            fontSize: 24.0,
          ),
          decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icon != null ? Icon(icon) : null,
          ),
          keyboardType: TextInputType.number,
        ));
  }
}