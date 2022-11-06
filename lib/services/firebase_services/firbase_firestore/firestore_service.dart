import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';

abstract class FirestoreService {


  // user reference
  late CollectionReference userRef; 
  // petReference
  late CollectionReference petRef;

  // add new user
  Future<void> addNew (UserObject userData);
  //new Pet
  Future<void> newPet (PetObject petData);
}