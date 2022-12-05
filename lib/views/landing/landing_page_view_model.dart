import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter/material.dart';

class LandingPageViewModel extends ApplicationViewModel {
  var screenSize = MediaQuery.of(getContext).size;

  void onScreenSizeChange() {
    debugPrint(screenSize.toString()); 
  }

  Future<dynamic> checkLogged() async {
    // checks for log persistence
    await getFirebaseUser();
    // checks if there is logged user
    if (userObject == null) {
      return await navigationService
          .pushNamed(Routes.login);
    } else {
      return await navigationService
          .pushNamed(Routes.home);
    } 
  }
}
