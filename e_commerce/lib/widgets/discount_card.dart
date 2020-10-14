
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // this is a very nice Widget, which brings toggle slide up/down out of the box
      child: ExpansionTile(
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        title: Text(
          "Cupom de Desconto", 
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          )
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Insira seu cupom"
              ),
              initialValue: Cart.of(context).couponCode ?? "",
              onFieldSubmitted: (text) {
                Firestore.instance.collection("coupons").document(text).get().then(
                  (couponSnap) {
                    if(couponSnap.data != null) {
                      Cart.of(context).setCoupon(text, couponSnap.data["percent"]);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Disconto de ${couponSnap.data['percent']}% aplicado."),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      );
                    } else {
                      Cart.of(context).setCoupon(null, 0);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Cupom inválido."),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}