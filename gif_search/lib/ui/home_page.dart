import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String trendingGifsUrl = "https://api.giphy.com/v1/gifs/trending?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&limit=20&rating=G";
  final String searchGifs = "https://api.giphy.com/v1/gifs/search?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&q=dogs&limit=20&offset=0&rating=G&lang=en";

  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if(_search==null)
      response = await http.get(trendingGifsUrl);
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=qDpZI23fCCocn0Co831jNndZkCkQNYih&q=$_search&limit=20&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  // JUST FOR TEST ABOVE METHOD, REMOVE IT LATTER
  @override
  void initState() {
    super.initState();
    _getGifs().then((data) => print(data));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}