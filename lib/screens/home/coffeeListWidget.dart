import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_firebase/models/Coffee.dart';
import 'package:coffee_firebase/screens/home/coffeeItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<List<Coffee>>(context);

    return ListView.builder(
      itemCount: coffees.length,

      itemBuilder: (context, index) {
        return CoffeeItemWidget(coffee: coffees[index],);
      },
    );
  }
}
