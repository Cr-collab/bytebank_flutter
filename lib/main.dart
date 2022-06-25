import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.blueAccent[700]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: ListaTransFerencias(),
    );
  }
}

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
