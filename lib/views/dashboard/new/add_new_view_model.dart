import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AddNewViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final FirestoreService firestoreService = locator<FirestoreService>();

  // page fields
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contacts = TextEditingController();
  TextEditingController petName = TextEditingController();
  TextEditingController specie = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  String? sex = "Male";

  // listens value changes from radio button
  void radioValueChanges(String? value) {
    sex = value;
    notifyListeners();
  }

  // listen for picked date
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

  // prepares new value
  void addNew(
      String firstName,
      String middlename,
      String lastName,
      String address,
      String contacts,
      String petName,
      String specie,
      String breed,
      String color,
      String birthDay,
      String sex) async {
    setBusy(true);
    // generate custom email
    String email =
        '${firstName.replaceAll(' ', '')}.${lastName.replaceAll(' ', '')}@boholvet.bh';
    String password = 'ChangeMe${DateFormat('MMddyy').format(DateTime.now())}';
    try {
      // creates new login credentials
      final newUser = await applicationViewModel.firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      // creates user object
      UserObject newClient = UserObject(
          uid: newUser.user!.uid,
          name: '$firstName $middlename $lastName',
          address: address,
          contacts: contacts);
      
      // creates new pet object
      PetObject newPet = PetObject(
        name: petName,
        specie: specie,
        breed: breed,
        color: color,
        birthday: birthDay,
        sex: sex,
        owner: newClient.uid,
      );

      // add new client data to firestore database
      await firestoreService.addNew(newClient, newPet);

      print(email);
      print(password);
      print(newClient.toFirestore());
      print(newPet.toFireStore());

      setBusy(false);

      showSnackbar(title: 'Success', message: 'New Client Added', maxWidth: 400);
    }on FirebaseAuthException catch (e) {
      if(e.code == 'netword-request-failed'){
        showDialog(
        context: getContext,
        builder: (_) {
          return const AlertDialog(
            title: Text('Error'),
            content: Text('Connection timed out'),
          );
        });
      }
      setBusy(false);
      rethrow;
    }
    setBusy(false);
  }
}
