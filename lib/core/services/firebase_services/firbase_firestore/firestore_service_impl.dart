import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/core/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {

  // initialize firestore instance
  final _db = FirebaseFirestore.instance;

 @override
  late CollectionReference<Object?> petRef = _db.collection('pets');
  
  @override
  late CollectionReference<Object?> userRef = _db.collection('users');

  // pushes new data into database
  @override
  Future<void> addNew(UserObject userData) async {
    try {
      // add new user to firestore
       userRef.doc(userData.uid).set(userData.toFirestore());
    } catch (e) {
      rethrow;
    }
  }

  // add new pet to firestore
  @override
  Future<void> newPet(PetObject petData) async {
    try {
      petRef.add(petData.toFireStore()).then((value) => value.update({'id': value.id}));
    } catch (e) {
      rethrow;
    }
  }
}
