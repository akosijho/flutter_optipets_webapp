import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/core/services/firebase_services/firebase_auth.dart';
import 'package:flutter_optipets_webapp/core/services/navigation/navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: ApplicationViewModel)
class ApplicationViewModel extends BaseViewModel {
  //firebase auth
  final Auth firebaseAuth = locator<Auth>();

  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  // key for form validation
  final formGlobalKey = GlobalKey<FormState>();

  // store user information
  UserObject? userObject;

  //routing service across pages
  final NavigationService navigationService = locator<NavigationService>();

  // checks if a user is currently logged in
  Future<void> getFirebaseUser() async {
    try{
      userObject = await firebaseAuth.getFirebaseUser() as UserObject;
    }catch(e){
      rethrow;
    }
    notifyListeners();
  }
}
