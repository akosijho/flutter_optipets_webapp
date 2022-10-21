import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: FirestoreService)
class FirestoreServiceImpl extends FirestoreService{
  // initialize firestore instance
  final _db = FirebaseFirestore.instance;

  // pushes new data into database
  @override
  Future<void> addNew(UserObject userData, PetObject petData) async {
    try{
      _db.collection('users').doc(userData.uid).set(userData.toFirestore());
      _db.collection('pets').add(petData.toFireStore()).then((value) => print(value.id));
    }catch(e){
      rethrow;
    }
  }
}