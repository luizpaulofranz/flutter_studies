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
  //to handle the undo option
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedIndex;

  @override
  void initState() {
    super.initState();
    this._getData().then((tasksAsJson) {
      setState(() {
        _todoList = json.decode(tasksAsJson);
      });
    });
  }

  void _addToDo() {
    String task = _todoController.text;
    Map<String, dynamic> newTodo = Map();
    newTodo["title"] = task;
    newTodo["ok"] = false;
    _todoController.text = "";
    setState(() {
      // to save on device
      _saveData();
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

  // here we reordenate the list and simulates a delay
  Future<void> _refreshTaskList() async {
    Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _todoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });
    });
    _saveData();
  }

  Widget buildListItem(BuildContext context, int index) {
    // to add behaviours sliding over some item
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      // here we set de directions that we wish to swipe
      //direction: DismissDirection.horizontal,
      // and here we can set the second possible swipe background
      //secondaryBackground: Container(color: Colors.green),
      direction: DismissDirection.startToEnd,
      // this function takes the swipped direction, in our case is just one possible, so we dont use it
      onDismissed: (direction) {
        // here we delete and show a snackbar
        setState(() {
          _lastRemovedIndex = index;
          _lastRemoved = Map.from(_todoList[index]);
          _todoList.removeAt(index);
          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            duration: Duration(seconds: 4),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _todoList.insert(_lastRemovedIndex, _lastRemoved);
                  _saveData();
                });
              },
            ),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
      // ListTile and CheckboxListTile are defaults list_item in flutter
      child: CheckboxListTile(
        title: Text(_todoList[index]["title"]),
        value: _todoList[index]["ok"],
        // called when we check the checkbox item, receives a boolean as parameter
        onChanged: (checked) {
          setState(() {
            _todoList[index]["ok"] = checked;
            // to save on device
            _saveData();
          });
        },
        secondary: CircleAvatar(
          child: Icon(_todoList[index]["ok"] ? Icons.check : Icons.error),
        ),
      ),
    );
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
            // to refresh our list when we drag it down
            child: RefreshIndicator(
              onRefresh: _refreshTaskList,
              // we use a ListView.builder() to create our list on demand, the hidden itens wont consume any resource
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: _todoList.length,
                itemBuilder: buildListItem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
