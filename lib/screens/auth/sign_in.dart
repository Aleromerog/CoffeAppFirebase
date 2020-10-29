import 'package:coffee_firebase/constants.dart';
import 'package:coffee_firebase/loadingWidget.dart';
import 'package:coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleFunc;
  SignIn({this.toggleFunc});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String pass = '';

  final _formKey = GlobalKey<FormState>();

  String error = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingWidget(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign in to Coffee App'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Register', style: TextStyle(color: Colors.white),),
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
              Container(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator:(val){
                    return !val.contains('@') ? 'Invalid email' : null;
                  },
                  maxLines: 1,
                  decoration: kTextInputDecorator.copyWith(hintText: 'Email'),

                ),
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
                    dynamic result = await _auth.signInWithEmailAndPassword(email, pass);
                    if(result == null){
                      setState(() {
                        isLoading = false;
                        error = 'Usuario invalido';
                      });
                    }
                  }
                },
                color: Colors.pink[400],
                child: Text('Sign in',
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
