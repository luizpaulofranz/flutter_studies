import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product.dart';

/*
 * This class is a proxy for a real product. And this is what will be in the cart.
 */
class CartProduct {
  
  String id;

  String category;
  String product_id;

  int quantity;
  String size;

  Product product;

  CartProduct({
    this.id,
    this.category,
    this.product_id,
    this.quantity,
    this.size,
    this.product
  });

  CartProduct.fromDocument(DocumentSnapshot cartProductDocument){
    id = cartProductDocument.documentID;
    category = cartProductDocument.data["category"];
    product_id = cartProductDocument.data["product_id"];
    quantity = cartProductDocument.data["quantity"];
    size = cartProductDocument.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "product_id": product_id,
      "quantity": quantity,
      "size": size,
      "product": product.toResumedMap()
    };
  }

}