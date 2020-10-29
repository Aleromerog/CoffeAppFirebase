import 'package:coffee_firebase/models/Coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeItemWidget extends StatelessWidget {
  final Coffee coffee;

  CoffeeItemWidget({this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          title: Text(coffee.name),
          subtitle: Text('Takes ${coffee.sugars} sugar(s)'),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[coffee.strength],
          ),

        ),
      ),
    );
  }
}
