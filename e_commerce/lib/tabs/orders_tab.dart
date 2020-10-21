import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/widgets/order_tile.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if(User.of(context).isLoggedIn()) {
      
      String uid = User.of(context).firebaseUser.uid;

      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("users").document(uid).collection("orders").getDocuments(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView(
            children: snapshot.data.documents.map(
              (order) => OrderTile(order.documentID)
            ).toList(),
          );          
        },
      );
    } else 
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.view_list, size: 80, color: Theme.of(context).primaryColor),
            SizedBox(height: 16),
            Text(
              "Faça o login para visualizar os pedidos.",
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
  }
}