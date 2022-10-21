import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';

abstract class FirestoreService {

  Future<void> addNew (UserObject userData, PetObject petData);
}