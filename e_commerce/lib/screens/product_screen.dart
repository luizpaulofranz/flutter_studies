import 'package:carousel_pro/carousel_pro.dart';
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

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) => NetworkImage(url)).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
              //autoplayDuration: Duration(milliseconds: 3000),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}