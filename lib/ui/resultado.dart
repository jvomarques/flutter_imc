import 'package:flutter/material.dart';


class Resultado extends StatelessWidget {
  
  String _texto;
  String _imagem;

  Resultado(this._texto, this._imagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Image(image: AssetImage("images/"+_imagem), height: 300,),
          ),
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
