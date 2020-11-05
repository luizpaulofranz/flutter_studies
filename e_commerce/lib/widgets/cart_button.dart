import 'package:e_commerce/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.shopping_basket, color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CartScreen())
        );
      },
    );
  }
}