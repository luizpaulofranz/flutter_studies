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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      // to avoid problems with keyboard overflow
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          //stretch fill all width, unless the element itself has a width setted
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),
              decoration: InputDecoration(
                labelText: "Peso em Kg",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),
              decoration: InputDecoration(
                labelText: "Altura em cm",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
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
                onPressed: () {},
              ),
            ),
            Text(
              "Info",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
