import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/*
 *  This class uses ScopedModel (extends Model part), is used to provide methods and data over the widget tree.
 */
class Cart extends Model {

  User user;

  List<CartProduct> products = [];

  bool isLoading = false;

  Cart(this.user);

  // thats how we build our own "of" method
  static Cart of(BuildContext context) => ScopedModel.of<Cart>(context);

  void addCartItem(CartProduct item) {
    this.products.add(item);

    Firestore.instance.collection("users").document(user.firebaseUser.uid)
      .collection("cart").add(item.toMap())
      .then((firebaseDoc) {
        item.id = firebaseDoc.documentID;
      });

    notifyListeners();
  }

  void removeCartItem(CartProduct item) {
    Firestore.instance.collection("users").document(user.firebaseUser.uid)
      .collection("cart").document(item.id).delete();

    this.products.remove(item);
    notifyListeners();
  }

}