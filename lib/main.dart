import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children: <Widget>[
      Text(
        "Cristiano Azevedo",
        textDirection: TextDirection.ltr,
      ),
      Text("Cristiano Azevedo - ", textDirection: TextDirection.rtl),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: const FlutterLogo(),
        ),
      ),
    ],
  ));
}
