import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8),
            child: ScopedModelDescendant<Cart>(
              builder: (context, child, model) {
                int productCount = model.products.length;
                return Text(
                  "${productCount ?? 0} ${productCount == 1 ? "Item" : "Itens"}",
                  style: TextStyle(fontSize: 17),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}