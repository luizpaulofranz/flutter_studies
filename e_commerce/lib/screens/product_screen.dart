import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {

  final Product product;

  ProductScreen({this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState(product: product);
}

class _ProductScreenState extends State<ProductScreen> {

  final Product product;

  _ProductScreenState({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Product Page"),
    );
  }
}