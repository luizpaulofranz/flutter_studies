import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {

  final Product product;

  ProductScreen({this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState(product: product);
}

class _ProductScreenState extends State<ProductScreen> {

  final Product product;
  String size;

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
                SizedBox(height: 16),
                Text(
                  "Tamanho",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes.map(
                      (size) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              this.size = size;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: this.size == size ? primaryColor : Colors.grey[500]
                              )
                            ),
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(size),
                          ),
                        );
                      }
                    ).toList(),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: RaisedButton(
                    onPressed: size == null ? null :
                      () {
                        if(User.of(context).isLoggedIn()) {
                          var product = CartProduct(
                            size: this.size,
                            quantity: 1,
                            product: this.product,
                            product_id: this.product.id,
                            category: this.product.category,
                          );

                          Cart.of(context).addCartItem(product);
                        } else
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginScreen())
                          );
                      },
                    child: Text(User.of(context).isLoggedIn() ? "Adicionar ao Carrinho" : "Entre para Comprar", style: TextStyle(fontSize: 18)),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16,
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