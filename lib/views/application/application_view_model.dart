import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firebase_auth.dart';
import 'package:flutter_optipets_webapp/services/navigation/navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: ApplicationViewModel)
class ApplicationViewModel extends BaseViewModel{

    //firebase auth
  final Auth auth = locator<Auth>(); 

  // key for form validation
  final formGlobalKey = GlobalKey<FormState>();

  // store user information
  UserObject? userObject;

  //routing service across pages
  final NavigationService navigationService = locator<NavigationService>();
}