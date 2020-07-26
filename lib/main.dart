import 'package:flutter/material.dart';
import 'package:flutter_imc/ui/resultado.dart';

void main() {
  runApp(
      MaterialApp(
        title: "Calculadora IMC", 
        home: Home()
      )
  ); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _textoResultado = "";
  String _imagemResultado = "";

  void _calcular() {
    setState(() {

      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text)/100;
      double imc = peso/(altura*altura);

      if (imc < 18.6){
        _textoResultado = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "thin-man.png";
      }
      else if (imc >= 18.6 && imc < 24.9){
        _textoResultado = "Peso ideal (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "medium-man.png";
      }
      else if (imc >= 24.9 && imc < 29.9){
        _textoResultado = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "little-fat-man.png";
      }
      else if (imc >= 29.9 && imc < 34.9){
        _textoResultado = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "fat-man.png";
      }
      else if (imc >= 34.9 && imc < 39.9){
        _textoResultado = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "big-fat-man.png";
      }
      else if (imc >= 40){
        _textoResultado = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
        _imagemResultado = "big-fat-man.png";
      }

      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        Resultado(_textoResultado, _imagemResultado)));

    });
  }

  void _resetar(){
    _formKey.currentState.reset();
    pesoController.clear();
    alturaController.clear();
    setState(() {
      _textoResultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetar,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120, color: Colors.indigo),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.indigo)
                ),
                controller: pesoController,
                validator: (peso) {
                  if (peso.isEmpty) 
                    return "Insira seu peso";
                }
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.indigo)
                ),
                controller: alturaController,
                validator: (altura) {
                  if (altura.isEmpty) 
                    return "Insira sua altura";
                }
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: 
                  ButtonTheme(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () { 
                        if (_formKey.currentState.validate())
                           _calcular();
                      },
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0)),  
                    ),
                  ),
              ),
              Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo, fontSize: 25.0),
              )

            ],
          ),
        )
        ),
    );
  }


}