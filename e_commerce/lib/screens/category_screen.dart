import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  final Map<String, dynamic> category;

  const CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    // this is how we create tab / tabulated pages
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(category["title"]),
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
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}