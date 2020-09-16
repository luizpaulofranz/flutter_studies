import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {

  final CartProduct product;

  CartTile(this.product);

  Widget _buildContent(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 120,
          child: Image.network(
            product.product.images[0],
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  "Tamanho ${product.size}",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  "R\$ ${product.product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      color: Theme.of(context).primaryColor,
                      onPressed: product.quantity > 0 ? 
                      () {
                        Cart.of(context).decrementQuantity(product);
                      } : null,
                    ),
                    Text(
                      product.quantity.toString(),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Cart.of(context).incrementQuantity(product);
                      },
                    ),
                    FlatButton(
                      child: Text("Remover"),
                      textColor: Colors.grey[500],
                      onPressed: () {
                        Cart.of(context).removeCartItem(product);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: product.product == null ?
        FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance.collection("products").document(product.category).collection("items").document(product.product_id).get(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              product.product = Product.fromDocument(snapshot.data);
              return _buildContent(context);
            } else
              return Container(
                height: 70,
                child: CircularProgressIndicator(),
                alignment: Alignment.centerRight,
              );
          },
        ) :
        _buildContent(context),
    );
  }
}