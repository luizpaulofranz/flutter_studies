import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif_search/ui/gif_page.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String trendingGifsUrl =
      "https://api.giphy.com/v1/gifs/trending?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&limit=20&rating=G";
  final String searchGifs =
      "https://api.giphy.com/v1/gifs/search?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&q=dogs&limit=20&offset=0&rating=G&lang=en";

  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search == null)
      response = await http.get(trendingGifsUrl);
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&q=$_search&limit=19&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  int _getItensCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    // this is an interesting option to create grids, see also
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _getItensCount(snapshot.data["data"]),
      itemBuilder: (context, index) {
        // to put the button that loads more items
        if (_search == null || index < snapshot.data["data"].length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GifPage(gifData: snapshot.data["data"][index])));
            },
            onLongPress: () {
              Share.share(snapshot.data["data"][index]["images"]["fixed_height"]
                  ["url"]);
            },
            child: Image.network(
              snapshot.data["data"][index]["images"]["fixed_height"]["url"],
              height: 300,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Container(
            child: GestureDetector(
              onTap: () {
                // we increase the offset and triggers rerunning of build method, whi has a FutureBuilder that makes the request again
                setState(() {
                  _offset += 19;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70,
                  ),
                  Text(
                    "Carregar mais ...",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(
            "https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                labelText: "Pesquise aqui...",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
              // when we click on done ate keyboard, receiving text typed as param
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                  _offset = 0;
                });
              },
            ),
          ),
          Expanded(
            // every time that build method runs, this is runned again
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        // this is used to change color when loading
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container(
                        child: Text("Ocorreu um erro =/"),
                      );

                    return _createGifTable(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
