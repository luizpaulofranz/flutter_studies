import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  final Map<String, dynamic> gifData;

  GifPage({this.gifData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(gifData["images"]["fixed_height"]["url"]);
            },
          )
        ],
        title: Text(
          gifData["title"],
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.network(gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
