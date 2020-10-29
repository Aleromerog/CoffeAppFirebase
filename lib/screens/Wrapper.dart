import 'package:coffee_firebase/models/User.dart';
import 'package:coffee_firebase/screens/auth/Authentication.dart';
import 'package:coffee_firebase/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Authentication() : Home();
  }
}
