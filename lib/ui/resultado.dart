import 'package:flutter/material.dart';


class Resultado extends StatelessWidget {
  
  String _texto;

  Resultado(this._texto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            _texto,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.indigo, fontSize: 25.0),
          )
        ],
      )
    );
  }
  
}
