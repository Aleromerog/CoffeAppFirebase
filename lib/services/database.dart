import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_firebase/models/Coffee.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  
  final CollectionReference coffeeCollection = Firestore.instance.collection('coffeePrefs');

  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection.document(uid).setData({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength,
    });
  }

  // Map Query to coffee

  List<Coffee> _getCoffeesFromSnapshots(QuerySnapshot snapshot){
    return snapshot.documents.map((e) => Coffee(
        name: e.data['name'] ?? '',
        strength: e.data['strength'] ?? 0,
      sugars: e.data['sugars'] ?? '0',
    ) ).toList();
  }

  Stream<List<Coffee>> get coffees{
    return coffeeCollection.snapshots().map(_getCoffeesFromSnapshots);
  }
}