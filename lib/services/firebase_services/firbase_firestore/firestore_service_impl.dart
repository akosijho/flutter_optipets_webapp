import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: FirestoreService)
class FirestoreServiceImpl extends FirestoreService {
  // initialize firestore instance
  final _db = FirebaseFirestore.instance;
  // user reference
  late CollectionReference userRef = _db.collection('user');
  // petReference
  late CollectionReference petRef = _db.collection('pets');

  // pushes new data into database
  @override
  Future<void> addNew(UserObject userData) async {
    try {
      // add new user to firestore
      userRef.doc(userData.uid).set(UserObject(
              uid: userData.uid,
              firstName: userData.firstName,
              middleName: userData.middleName,
              lastName: userData.lastName,
              address: userData.address,
              contacts: userData.contacts)
          .toFirestore());
    } catch (e) {
      rethrow;
    }
  }

  // add new pet to firestore
  @override
  Future<void> newPet(PetObject petData) async {
    try {
      petRef.add(PetObject(
        name: petData.name,
        specie: petData.specie,
        breed: petData.breed,
        color: petData.color,
        birthday: petData.birthday,
        sex: petData.sex,
        owner: petData.owner
      ).toFireStore()).then((value) => value.update({'id': value.id}));
    } catch (e) {
      rethrow;
    }
  }
}
