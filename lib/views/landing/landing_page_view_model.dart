import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LandingPageViewModel extends BaseViewModel {
  var screenSize = MediaQuery.of(getContext).size;
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  void onScreenSizeChange() {
    debugPrint(screenSize.toString());
  }

  Future<dynamic> checkLogged() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return await applicationViewModel.navigationService
          .pushNamed(Routes.login);
    } else {
      return await applicationViewModel.navigationService
          .pushNamed(Routes.home);
    }
  }
}
