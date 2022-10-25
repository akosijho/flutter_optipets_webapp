import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';

abstract class FirestoreService {

  // add new user
  Future<void> addNew (UserObject userData);
  //new Pet
  Future<void> newPet (PetObject petData);
}