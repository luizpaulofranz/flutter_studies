import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

const url = 'https://api.hgbrasil.com/finance';

Future<Map> getData() async {
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

void main() async {
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor de Moedas \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
