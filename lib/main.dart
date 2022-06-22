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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando transferencia")),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            style: TextStyle(
              fontSize: 24.0,
            ),
            decoration:
                InputDecoration(labelText: 'Numero da Conta', hintText: '0000'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            style: TextStyle(
              fontSize: 24.0,
            ),
            decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '100.0'),
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Confirmar'))
      ]),
    );
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
}
