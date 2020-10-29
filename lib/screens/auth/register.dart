import 'package:coffee_firebase/loadingWidget.dart';
import 'package:coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Register extends StatefulWidget {
  final Function toggleFunc;
  Register({this.toggleFunc});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String pass = '';
  String error = '';

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingWidget() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign up to Coffee App'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign in', style: TextStyle(color: Colors.white),),
            onPressed: (){
              widget.toggleFunc();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                validator:(val){
                  return !val.contains('@') ? 'Invalid email' : null;
                },
                decoration: kTextInputDecorator.copyWith(hintText: 'Email'),

              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                },
                obscureText: true,
                validator:(val){
                  return val.length < 6  ? 'Invalid pass' : null;
                },
                decoration: kTextInputDecorator.copyWith(hintText: 'Password'),

              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      setState(() {
                        isLoading = true;
                      });
                      dynamic result = _auth.registerWithEmailAndPassword(email, pass);
                      if(result == null){
                        setState(() {
                          isLoading = false;
                          error = 'Hubo un error';
                        });
                      }

                    }
                  },
                  color: Colors.pink[400],
                  child: Text('Register',
                    style: TextStyle(color: Colors.white),
                  )
              ),
              SizedBox(height: 20,),
              Text(error, style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
