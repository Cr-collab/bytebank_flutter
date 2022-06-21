import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(children: <Widget>[
        Card(
            child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("100.00"),
          subtitle: Text('45085-9'),
        )),
        Card(
            child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("100.00"),
          subtitle: Text('45085-9'),
        ))
      ]),
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

