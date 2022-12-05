import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:image_network/image_network.dart';

class LoginViewModel extends ApplicationViewModel {
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
    await navigationService
        .pushReplacementNamed(Routes.home);
  }

  // sign in with credentialsflutter pub
  void signIn(String email, String password) async {
    setBusy(true);
    try {
      final user = await auth.signInWithCredentials(
          email.replaceAll(' ', ''), password);
      if (user != null) {
        await userRef.doc(user.uid).get().then((value) => userObject = UserObject.fromJson(value.data()!));
        //Check user role
        if (userObject!.role == 'staff' ||
            userObject!.role == 'su' ||
            userObject!.role == 'practitioner') {
          await navigationService
              .pushReplacementNamed(Routes.home);
        } else {
          await auth.signOut();
          userObject = null;
          showDialog(
              context: getContext,
              builder: (context) => const AlertDialog(
                    title: ImageNetwork(
                        image:
                            'https://124135-361502-raikfcquaxqncofqfm.stackpathdns.com/asset/img/cartoon/authorized_personnel_only-1.png',
                        height: 400,
                        width: 400),
                  ));
          showSnackbar(
            title: 'Oops',
            message: 'Only clinic staff are allowed beyond this point.',
            maxWidth: 480);
        }
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
