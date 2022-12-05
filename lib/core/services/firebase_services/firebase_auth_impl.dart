import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/core/services/firebase_services/firebase_auth.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: Auth)
class AuthImpl implements Auth{

  //instantiate Firebase Auth package
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // simply return a user object from firebase user
  @override
  UserObject? userFromFirebase(dynamic user) {
    return UserObject(uid: user.uid);
  }

  @override
  Future signInWithCredentials(String email, String password) async {
    try{
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    // User user = result.user!;
    return userFromFirebase(result.user);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future signOut() async {
     try{
      return await _auth.signOut();
    }catch(e){
      rethrow;
    }
  }

}