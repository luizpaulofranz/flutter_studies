import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final Map<String, dynamic> category;

  CategoryTile({this.category});

  @override
  Widget build(BuildContext context) {
    // with ListTile has some useful resources, like leading and trailing for instance
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(category["icon"]),
      ),
      title: Text(category["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}