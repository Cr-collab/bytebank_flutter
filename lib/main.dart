import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroDaConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando transferencia")),
      body: Column(children: <Widget>[
        Editor(
            controlador: _controladorCampoNumeroDaConta,
            rotulo: 'Numero da Conta',
            dica: '0000'),
        Editor(
            controlador: _controladorCampoValor,
            rotulo: 'valor',
            dica: '100.0',
            icon: Icons.monetization_on),
        ElevatedButton(
            onPressed: () => _criaTransferencia(
                _controladorCampoNumeroDaConta.text,
                _controladorCampoValor.text),
            child: Text('Confirmar')),
      ]),
    );
  }
}

void _criaTransferencia(numeroDaContaParametro, valorParametro) {
  final int? numeroConta = int.tryParse(numeroDaContaParametro);
  final double? valor = double.tryParse(valorParametro);

  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
   debugPrint("${transferenciaCriada}");
  }
}

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

class ListaTransFerencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(100.00, 505010)),
        ItemTransferencia(Transferencia(200.00, 505010)),
        ItemTransferencia(Transferencia(400.00, 505010)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.value.toString()),
      subtitle: Text(_transferencia.accountNumber.toString()),
    ));
  }
}

class Transferencia {
  final double value;
  final int accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia { valor : $value , accountNumber : $accountNumber }';
  }
}
