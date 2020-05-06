import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados.";

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados.";
      _formKey.currentState.reset();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)}).";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(4)}).";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)}).";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)}).";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)}).";
      } else if (imc >= 39.9) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)}).";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is an base widget from material, which implements some base resources like appBar
    return Scaffold(
      // material appBar
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      // to avoid problems with keyboard overflow
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            //stretch fill all width, unless the element itself has a width setted
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                decoration: InputDecoration(
                  labelText: "Peso em Kg",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                controller: weightController,
                // that's how we can validate our inputs
                validator: (value) {
                  if (value.isEmpty) return "Insira o peso.";
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                decoration: InputDecoration(
                  labelText: "Altura em cm",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) return "Insira a altura.";
                },
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  // first we check if our form is valid
                  onPressed: () {
                    if (_formKey.currentState.validate()) calculate();
                  },
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
