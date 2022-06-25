import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Editor.dart';
import '../models/Transferencia.dart';


class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroDaConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando transferencia")),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
              controlador: widget._controladorCampoNumeroDaConta,
              rotulo: 'Numero da Conta',
              dica: '0000'),
          Editor(
              controlador: widget._controladorCampoValor,
              rotulo: 'valor',
              dica: '100.0',
              icon: Icons.monetization_on),
          ElevatedButton(
              onPressed: () => _criaTransferencia(
                  widget._controladorCampoNumeroDaConta.text,
                  widget._controladorCampoValor.text,
                  context),
              child: Text('Confirmar')),
        ]),
      ),
    );
  }
}



void _criaTransferencia(numeroDaContaParametro, valorParametro, context) {
  final int? numeroConta = int.tryParse(numeroDaContaParametro);
  final double? valor = double.tryParse(valorParametro);

  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint("${transferenciaCriada} nbbbbbbbbbb");
    Navigator.pop(context, transferenciaCriada);
  }
}