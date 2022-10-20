import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AddNewViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  String? sex = "Male";

  TextEditingController birthDay = TextEditingController();

  // listens value changes from radio button
  void radioValueChanges(String? value) {
    sex = value;
    notifyListeners();
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: getContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(1989, 1),
      lastDate: DateTime.now(),
    );

    if(pickedDate != null){
      birthDay.text = DateFormat('MMM dd, yyyy').format(pickedDate);
      notifyListeners();
    }
  }
}
