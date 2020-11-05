import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        // that's how we put a line to divide our ListTiles
        var dividedTiles = ListTile.divideTiles(
          tiles: snapshot.data.documents.map(
            (category) {
              return CategoryTile(categorySnapshot: category);
            }
          ).toList(),
          color: Colors.grey[500]
        ).toList();

        return ListView(
          children: dividedTiles,
        );
      },
    );
  }
}