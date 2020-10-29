import 'package:coffee_firebase/screens/auth/register.dart';
import 'package:coffee_firebase/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool isSignIn = true;
  void toogleFunction(){
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignIn ? SignIn(toggleFunc: toogleFunction) : Register(toggleFunc: toogleFunction);
  }
}
