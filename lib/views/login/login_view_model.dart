import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

   //controls the scroll position
  final ScrollController scrollController = ScrollController();

  String email = '';
  String password = '';

  //controls obscure text in password field
  bool isObscure = true;

  void isFieldObscure() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    notifyListeners();
  }

  void home() async {
    await applicationViewModel.navigationService.pushReplacementNamed(Routes.home);
  }

  // sign in with credentials
  void signIn(String email, String password) async {
    try {
      final user = await applicationViewModel.auth
          .signInWithCredentials(email, password);
      if (user != null) {
        applicationViewModel.userObject = user;
        await applicationViewModel.navigationService.pushReplacementNamed(Routes.home);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(
            title: 'Oops',
            message: 'No user found for that email.',
            maxWidth: 480);
      } else if (e.code == 'wrong-password') {
        showSnackbar(
            title: 'Oops',
            message: 'Wrong password provided for that user.',
            maxWidth: 480);
      } else {
        showSnackbar(
            title: 'Oops',
            message: 'Something went wrong. Please try again',
            maxWidth: 480);
      }
    }
    setBusy(false);
    notifyListeners();
  }
}
