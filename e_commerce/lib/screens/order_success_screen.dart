import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {

  final String orderId;

  OrderSuccessScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center, 
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check, 
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            Text(
              "Pedido realizado com sucesso!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Código do Pedido: $orderId",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}