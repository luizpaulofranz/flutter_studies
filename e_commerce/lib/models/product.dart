import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  String category;
  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    title = document.data["title"];
    description = document.data["description"];
    price = document.data["price"] + 0.0;
    images = document.data["images"];
    sizes = document.data["sizes"];
  }

  Map<String, dynamic> toResumedMap() {
    return {
      "title": title,
      "description": description,
      "price": price
    };
  }

}