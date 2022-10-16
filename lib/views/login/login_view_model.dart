import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  final TextEditingController userController = TextEditingController();

  //controls the scroll position
  final ScrollController scrollController = ScrollController();

  //controls obscure text in password field
  bool isObscure = true;

  void isFieldObscure() {
    if(isObscure){
      isObscure = false;
    }else{
      isObscure = true;
    }
    notifyListeners();
  }
}
