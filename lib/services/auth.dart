import 'package:coffee_firebase/models/User.dart';
import 'package:coffee_firebase/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  User _getUserFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _getUserFromFirebaseUser(user));
  }

  Future<User> signInAnon() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _getUserFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String pass) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData('0', 'New Coffee User', 100);
      return _getUserFromFirebaseUser(user);
    } catch(e){
      print(e);
      return null;
    }

  }

  Future signInWithEmailAndPassword(String email, String pass) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _getUserFromFirebaseUser(user);
    } catch(e){
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e){
      print(e);
    }
  }
}