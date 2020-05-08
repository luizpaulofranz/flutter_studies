import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  List _todoList = [];

  Future<File> _getJsonFile() async {
    // to get an hidden app folder to save our data, for Ios or Android
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/appData.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_todoList);
    final file = await _getJsonFile();
    return file.writeAsString(data);
  }

  Future<String> _getData() async {
    try {
      final file = await _getJsonFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
