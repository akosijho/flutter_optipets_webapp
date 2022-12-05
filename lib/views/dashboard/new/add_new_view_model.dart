// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/core/services/firebase_services/firbase_firestore/firestore_service.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_state.dart';
import 'package:flutter_optipets_webapp/views/widgets/show_snackbar.dart';

class AddNewViewModel extends ApplicationViewModel {
  AddNewViewModel({required this.state, this.user});

  final FirestoreService firestoreService = locator<FirestoreService>();
  final HomeViewModel homeViewModel = locator<HomeViewModel>();

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
  bool enabled = true, personalInfo = true;

  void init() {
    setBusy(true);
    clear();
    changeState();
    setBusy(false);
    notifyListeners();
  }

  // just a mthod
  changeState(){
    if (state == ViewState.newClient) {
      state = ViewState.newClient;
      clear();
      enabled = true;
    }
    if (state == ViewState.viewClient) {
      state = ViewState.viewClient;
      firstName.text = user!.firstName!;
      middleName.text = user!.middleName!;
      lastName.text = user!.lastName!;
      address.text = user!.address!;
      contacts.text = user!.contacts!;
      email.text = user!.email!;
      enabled = false;
    }
    if (state == ViewState.newStaff) {
      state = ViewState.newStaff;
      clear();
      enabled = true;
    }
    if (state == ViewState.newPet) {
      state = ViewState.newPet;
      firstName.text = user!.firstName!;
      middleName.text = user!.middleName!;
      lastName.text = user!.lastName!;
      address.text = user!.address!;
      contacts.text = user!.contacts!;
      email.text = user!.email!;
      enabled = false;
      personalInfo = true;
    }
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
      final newUser = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // creates user object to be saved to firestore database
      UserObject newClient = UserObject(
          uid: newUser.user!.uid,
          firstName: firstName,
          middleName: middlename,
          lastName: lastName,
          address: address,
          role: 'client',
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

  // adds new Staff
  newStaff(
    String firstName,
    String middlename,
    String lastName,
    String address,
    String contacts,
    String email,
  ) async {
    setBusy(true);
    String password = 'ChangeMe${DateFormat('MMddyy').format(DateTime.now())}';
    try {
      // creates new login credentials
      final newUser = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // creates user object to be saved to firestore database
      UserObject newStaff = UserObject(
          uid: newUser.user!.uid,
          firstName: firstName,
          middleName: middlename,
          lastName: lastName,
          address: address,
          role: 'staff',
          contacts: contacts,
          email: email,
          createdAt: DateTime.now().toString());

      // add new client data to firestore database
      await firestoreService.addNew(newStaff);
      setBusy(false);

      showSnackbar(title: 'Success', message: 'New Staff Added', maxWidth: 400);
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
      rethrow;
    }
    setBusy(false);
  }

  // add Pet
  addPet(UserObject user, String petName, String specie, String breed,
      String color, String weight, String birthDay, String sex) async {
    setBusy(true);
    try {
      PetObject newPet = PetObject(
          name: petName,
          specie: specie,
          breed: breed,
          color: color,
          birthday: birthDay,
          weight: weight,
          sex: sex,
          owner: user.uid,
          createdAt: DateTime.now().toString());
      await firestoreService.newPet(newPet);

      // update user pet count
      int pets = user.pets ?? 0;
      await userRef.doc(user.uid).update({"pets": pets++});

      // clear inputs
      clear();

      // redirect to client view
      homeViewModel.addNew(ViewState.viewClient, user: user);

      showSnackbar(
          title: 'Sucessful', message: 'Pet added to account.', maxWidth: 400);
    } catch (e) {
      showSnackbar(
          title: 'Oops!', message: 'Something went wrong!', maxWidth: 400);
    }
    setBusy(false);
  }

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
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth
          .sendPasswordResetEmail(email: email.trim());
      showSnackbar(
          title: 'Successful!', message: 'Password reset sent', maxWidth: 400);
    } on FirebaseAuthException catch (e) {
      showSnackbar(
          title: 'Something went wrong1', message: e.message!, maxWidth: 400);
    }
  }
}
