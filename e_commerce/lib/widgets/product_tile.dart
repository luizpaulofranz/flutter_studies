import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final Product product;

  ProductTile({this.type, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(product: this.product)));
      },
      child: Card(
        child: type == "grid" ?
        // GRID VIEW
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: Image.network(product.images[0], fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(fontWeight: FontWeight.w500))  ,
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) :
        // LIST VIEW
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.network(product.images[0], fit: BoxFit.cover, height: 250),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(fontWeight: FontWeight.w500))  ,
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}