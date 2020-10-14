import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/widgets/cart_price_card.dart';
import 'package:e_commerce/widgets/cart_tile.dart';
import 'package:e_commerce/widgets/discount_card.dart';
import 'package:e_commerce/widgets/ship_card.dart';
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
      body: ScopedModelDescendant<Cart>(
        builder: (context, child, model) {
          if(model.isLoading && User.of(context).isLoggedIn()) 
            return Center(child: CircularProgressIndicator());

          else if(!User.of(context).isLoggedIn())
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart, size: 80, color: Theme.of(context).primaryColor),
                  SizedBox(height: 16),
                  Text(
                    "Faça o login para adicionar produtos.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen())
                      );
                    },
                  )
                ],
              ),
            );
          
          else if ( model.products == null || model.products.length == 0)
            return Center(
              child: Text(
                "Nenhum produto no carrinho!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );

          // it is good when we have a list both vertical and horizontal and it is scrollabe
          return ListView(
            children: [
              Column(
                children: model.products.map((p) => CartTile(p)).toList(),
              ),
              DiscountCard(),
              ShipCard(),
              CartPriceCard(() {
                print("Compra finalizada!");
              }),
            ]
          );
        },
      ),
    );
  }
}