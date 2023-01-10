import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:intl/intl.dart';

class ViewPetViewModel extends ApplicationViewModel {
  ViewPetViewModel({this.pet});

  final HomeViewModel homeViewModel = locator<HomeViewModel>();
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contacts = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController petName = TextEditingController();
  TextEditingController specie = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  
  TextEditingController notes = TextEditingController();
  String? sex = "Male";

  // use to block some sensitive fields
  bool enabled = true, personalInfo = true;

  PetObject? pet;
  UserObject? user;

  void init(){
    readPetOwner();
  }

  void readPetOwner() async {
    setBusy(true);
    try {
      await userRef.doc(pet!.owner!).get().then((value) {
        user = UserObject.fromJson(value.data()!);
      });
      
      firstName.text = user!.firstName!;
      middleName.text = user!.middleName!;
      lastName.text = user!.lastName!;
      address.text = user!.address!;
      contacts.text = user!.contacts!;
      email.text = user!.email!;
      petName.text = pet!.name!;
      specie.text = pet!.specie!;
      breed.text = pet!.breed!;
      color.text = pet!.color!;
      weight.text = pet!.weight ??  '';
      birthDay.text = pet!.birthday!;
      sex = pet!.sex!;
    } catch (e) {
      showSnackbar(
          title: 'Something went wrong!',
          message: 'Fetch data error\nTry Reloading the page');
      rethrow;
    }
    setBusy(false);
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: getContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(1989, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      birthDay.text = DateFormat('MMM dd, yyyy').format(pickedDate);
      notifyListeners();
    }
  }

  // listens value changes from radio button
  void radioValueChanges(String? value) {
    sex = value;
    notifyListeners();
  }
}
