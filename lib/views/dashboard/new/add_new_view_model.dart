// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_state.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';

class AddNewViewModel extends BaseViewModel {
  AddNewViewModel({required this.state, this.user});

  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final FirestoreService firestoreService = locator<FirestoreService>();

  // page fields
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
  String? sex = "Male";

// decides the purpose of the reusable widget
  ViewState state;

  // use to load fields
  UserObject? user;
  // use to block some sensitive fields
  bool enabled = true;

  void init() {
    setBusy(true);
    user = applicationViewModel.userObject!;
    switch (state) {
      case ViewState.newClient:
        state = ViewState.newClient;
        break;
      case ViewState.viewClient:
        state = ViewState.viewClient;
        firstName.text = user!.firstName!;
        middleName.text = user!.middleName!;
        lastName.text = user!.lastName!;
        address.text = user!.address!;
        contacts.text = user!.contacts!;
        email.text = user!.email!;
        enabled = false;
        break;
      case ViewState.newPet:
        state = ViewState.newPet;
        break;
      default:
        state = ViewState.newPet;
        break;
    }
    setBusy(false);
  }

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
      String email,
      String petName,
      String specie,
      String breed,
      String color,
      String weight,
      String birthDay,
      String sex) async {
    setBusy(true);
    String password = 'ChangeMe${DateFormat('MMddyy').format(DateTime.now())}';
    try {
      // creates new login credentials
      final newUser = await applicationViewModel.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // creates user object to be saved to firestore database
      UserObject newClient = UserObject(
          uid: newUser.user!.uid,
          firstName: firstName,
          middleName: middlename,
          lastName: lastName,
          address: address,
          role: 'su',
          contacts: contacts,
          email: email,
          pets: 1,
          createdAt: DateTime.now().toString());

      // creates new pet object
      PetObject newPet = PetObject(
          name: petName,
          specie: specie,
          breed: breed,
          color: color,
          birthday: birthDay,
          weight: weight,
          sex: sex,
          owner: newClient.uid,
          createdAt: DateTime.now().toString());

      // add new client data to firestore database
      await firestoreService.addNew(newClient);
      await firestoreService.newPet(newPet);
      setBusy(false);

      showSnackbar(
          title: 'Success', message: 'New Client Added', maxWidth: 400);
      clear();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'netword-request-failed') {
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

  update(
      String firstName,
      String middlename,
      String lastName,
      String address,
      String contacts,
      String email,
      String petName,
      String specie,
      String breed,
      String color,
      String birthDay,
      String sex) {}

// clears input
  void clear() {
    firstName.clear();
    middleName.clear();
    lastName.clear();
    address.clear();
    contacts.clear();
    email.clear();
    petName.clear();
    specie.clear();
    breed.clear();
    color.clear();
    weight.clear();
    birthDay.clear();
    sex = 'Male';
    notifyListeners();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await applicationViewModel.firebaseAuth
          .sendPasswordResetEmail(email: email.trim());
      showSnackbar(title: 'Successful!', message: 'Password reset sent', maxWidth: 400);
    } on FirebaseAuthException catch (e) {
      showSnackbar(
          title: 'Something went wrong1', message: e.message!, maxWidth: 400);
    }
  }
}
