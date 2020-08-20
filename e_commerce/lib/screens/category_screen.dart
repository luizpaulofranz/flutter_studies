import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot categorySnapshot;

  const CategoryScreen({this.categorySnapshot});

  @override
  Widget build(BuildContext context) {
    // this is how we create tab / tabulated pages
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(categorySnapshot.data["title"]),
          centerTitle: true,
          // TabBar is where tabs stands
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        // TabBarView is where the tab contents stays
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("products").document(categorySnapshot.documentID).collection("items").getDocuments(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                // we use the builder constructor to not load all data and build the entire Grid at once
                // with that flutter handles a kind of lazy loading
                GridView.builder(
                  padding: EdgeInsets.all(4),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ProductTile(type: "grid", product: Product.fromDocument(snapshot.data.documents[index]));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // number of grid coluns
                    crossAxisCount: 2,
                    // spacing between itens
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    // aspect ratio is computed dividing width by height
                    childAspectRatio: 0.65,
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.all(4),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ProductTile(type: "list", product: Product.fromDocument(snapshot.data.documents[index]));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}