import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot categorySnapshot;

  CategoryTile({this.categorySnapshot});

  @override
  Widget build(BuildContext context) {
    // with ListTile has some useful resources, like leading and trailing for instance
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(categorySnapshot.data["icon"]),
      ),
      title: Text(categorySnapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CategoryScreen(categorySnapshot: categorySnapshot))
        );
      },
    );
  }
}