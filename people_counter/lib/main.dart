import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de Pessoas.",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // our widget State
  int _people = 0;
  String _infoText = "Pode entrar.";

  void _changePeople(int delta) {
    // we need to use this function to force re-render
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo invertido?!";
      } else if (_people <= 10) {
        _infoText = "Pode entrar.";
      } else {
        _infoText = "Lotado, lamento!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/images/restaurant.jpg",
          // to ocupate the whole screen without distorsing, can cut the image but the proportions ar keeped
          fit: BoxFit.cover,
          // to get the screen size
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
