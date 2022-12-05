import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';

abstract class Auth{

// simply return a user object from firebase user
  UserObject? userFromFirebase(dynamic user);

  //sign in with credentials
  Future signInWithCredentials(String email, String password);

  // Create new user
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password);

  //sign out
  Future signOut();

  // send password reset email
  Future<void> sendPasswordResetEmail(String email);

  // checks if a user is currently logged in
  Future<void> getFirebaseUser();
}