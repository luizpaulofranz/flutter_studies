import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _animation = "Spin";
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_animation == "Spin") {
              _animation = "antiSpin";
            } else {
              _animation = "Spin";
            }
          });
        },
        onDoubleTap: () {
          setState(() {
            _isPaused = !_isPaused;
          });
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: FlareActor(
              "assets/spinGear.flr",
              animation: _animation,
              isPaused: _isPaused,
            ),
          ),
        ),
      ),
    );
  }
}
