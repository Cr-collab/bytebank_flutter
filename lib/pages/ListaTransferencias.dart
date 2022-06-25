import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/ItemTransferencia.dart';
import '../models/Transferencia.dart';
import 'FormularioTransferncia.dart';

class ListaTransFerencias extends StatefulWidget {
  final List<Transferencia> _transferencias =
      List<Transferencia>.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaTransFerenciasState();
  }
}

class ListaTransFerenciasState extends State<ListaTransFerencias> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          debugPrint('$transferencia chegou no adição visual');
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida) => {
                debugPrint('$transferenciaRecebida aaaaaaaaaaaaaaaas'),
                if (transferenciaRecebida != null)
                  {
                    setState(() {
                      widget._transferencias.add(transferenciaRecebida);
                    })
                  }
              });
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