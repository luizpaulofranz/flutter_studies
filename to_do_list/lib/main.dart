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
  final TextEditingController _todoController = TextEditingController();

  List _todoList = [];

  void _addToDo() {
    String task = _todoController.text;
    Map<String, dynamic> newTodo = Map();
    newTodo["title"] = task;
    newTodo["ok"] = false;
    _todoController.text = "";
    setState(() {
      _todoList.add(newTodo);
    });
  }

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
    // Scaffold is an base widget from material, which implements some base resources like appBar
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: <Widget>[
                // we use Expanded to set width/height to use maximum space available, not allowed inside all widgets
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("Add"),
                  textColor: Colors.white,
                  onPressed: () {
                    _addToDo();
                  },
                )
              ],
            ),
          ),
          Expanded(
            // we use a ListView.builder() to create our list on demand, the hidden itens wont consume any resource
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                // ListTile and CheckboxListTile are defaults list_item in flutter
                return CheckboxListTile(
                  title: Text(_todoList[index]["title"]),
                  value: _todoList[index]["ok"],
                  // called when we check the checkbox item, receives a boolean as parameter
                  onChanged: (checked) {
                    setState(() {
                      _todoList[index]["ok"] = checked;
                    });
                  },
                  secondary: CircleAvatar(
                    child: Icon(
                        _todoList[index]["ok"] ? Icons.check : Icons.error),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
