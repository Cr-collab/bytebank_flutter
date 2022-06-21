import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ListaTransFerencias(),
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    ),
  ));
}

class ListaTransFerencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      ItemTransferencia(Transferencia(100.00, 505010)),
      ItemTransferencia(Transferencia(200.00, 505010)),
      ItemTransferencia(Transferencia(400.00, 505010)),
      
    ]);
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
