import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class AddNewViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  String? sex = "Male";
  String birthDay = '';


  // listens value changes from radio button
  void radioValueChanges(String? value){
    sex = value;
    notifyListeners();
  }
}