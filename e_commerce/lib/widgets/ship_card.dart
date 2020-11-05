
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // this is a very nice Widget, which brings toggle slide up/down out of the box
      child: ExpansionTile(
        leading: Icon(Icons.location_on),
        title: Text(
          "Calcular Frete",
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
                hintText: "Digite seu CEP"
              ),
              initialValue: "",
              onFieldSubmitted: (text) {},
            ),
          )
        ],
      ),
    );
  }
}