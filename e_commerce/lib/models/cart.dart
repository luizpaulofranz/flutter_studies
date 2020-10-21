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
  String couponCode;
  int percentDiscount = 0;

  Cart(this.user) {
    if(this.user.isLoggedIn())
      _loadCartItems();
  }

  // thats how we build our own "of" method
  static Cart of(BuildContext context) => ScopedModel.of<Cart>(context);

  void _loadCartItems() async {
    QuerySnapshot cartProducts = await Firestore.instance.collection("users")
      .document(user.firebaseUser.uid).collection("cart").getDocuments();

    this.products = cartProducts.documents.map((doc) => CartProduct.fromDocument(doc)).toList();

    notifyListeners();
  }

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

  void incrementQuantity(CartProduct item) async {
    item.quantity++;

    await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart")
      .document(item.id).updateData(item.toMap());

    notifyListeners();
  }

  void decrementQuantity(CartProduct item) async {
    item.quantity--;

    await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart")
      .document(item.id).updateData(item.toMap());

    notifyListeners();
  }

  void setCoupon(String couponCode, int percent) {
    this.couponCode = couponCode;
    this.percentDiscount = percent;
  }

  void updatePrices() {
    notifyListeners();
  }

  double getProductsPrice() {
    double price = 0;
    for(CartProduct c in products) {
      if(c.product != null) {
        price += c.quantity * c.product.price;
      }
    }
    return price;
  }

  double getDiscount() {
    return getProductsPrice() * percentDiscount / 100;
  }

  double getShipPrice() {
    return 9.99;
  }

  // finishes the cart into an order and really do the purchase
  Future<String> orderCart() async {
    if(products.length == 0) return null;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice();
    double discount = getDiscount();

    DocumentReference order = await Firestore.instance.collection("orders").add(
      {
        "clientId": user.firebaseUser.uid,
        "products": products.map((cartProduct) => cartProduct.toMap()).toList(),
        "shipPrice": shipPrice,
        "productsPrice": productsPrice,
        "discount": discount,
        "total": productsPrice + shipPrice - discount,
        "status": 1 // 1 = preparing, 2 = shiping, 3 = done
      }
    );

    // save the orderId at user profile
    await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("orders")
      .document(order.documentID).setData(
        {
          "orderId": order.documentID
        }
      );

    // cleaning cart
    QuerySnapshot cartDocs = await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").getDocuments();
    for (DocumentSnapshot doc in cartDocs.documents) {
      doc.reference.delete();
    }
    products.clear();

    couponCode = null;
    percentDiscount = 0;

    isLoading = false;
    notifyListeners();

    return order.documentID;
  }

}