import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_firebase/models/Coffee.dart';
import 'package:coffee_firebase/screens/home/coffeeListWidget.dart';
import 'package:coffee_firebase/services/auth.dart';
import 'package:coffee_firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coffee>>.value(
      value: DatabaseService().coffees,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Coffe App'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async{
                await _auth.signOut();
              },
            )
          ],
        ),
        body: CoffeeList(),
      ),
    );
  }
}
