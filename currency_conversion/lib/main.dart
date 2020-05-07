import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

const url = 'https://api.hgbrasil.com/finance';

Future<Map> getData() async {
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _dollar;
  double _euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor de Moedas \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Carregando dados...',
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );

            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carrgegar dados :-(',
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              _dollar = snapshot.data['results']['currencies']['USD']['buy'];
              _euro = snapshot.data['results']['currencies']['EUR']['buy'];

              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      size: 150.0,
                      color: Colors.amber,
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Reais",
                        labelStyle: TextStyle(color: Colors.amber),
                        prefixText: "R\$ ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Dólar",
                        labelStyle: TextStyle(color: Colors.amber),
                        prefixText: "USD\$ ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Euro",
                        labelStyle: TextStyle(color: Colors.amber),
                        prefixText: "€\$ ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
