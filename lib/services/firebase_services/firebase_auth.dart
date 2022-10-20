import 'package:flutter_optipets_webapp/models/user_object.dart';

abstract class Auth{

// simply return a user object from firebase user
  UserObject? userFromFirebase(dynamic user);

  //sign in with credentials
  Future signInWithCredentials(String email, String password);

  //sign out
  Future signOut();
}