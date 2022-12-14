// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/appointments/appointments_view.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/clients_view.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home/home.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_pet/view_pet.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_state.dart';
import 'package:flutter_optipets_webapp/views/widgets/buildBody.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: HomeViewModel)
class HomeViewModel extends ApplicationViewModel {
  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController();
  
  final ScrollController childScrollController = ScrollController();
  final ScrollController childVerticalScrollController = ScrollController();

  Widget? child = const Home();
  UserObject? user;

  void init() async {
    setBusy(true);
    // check if a user is currently logged in
    await getFirebaseUser();
    if (userObject == null) {
      await navigationService
          .pushReplacementNamed(Routes.login);
    }
    setBusy(false);
  }

  void prints() {
    showDialog(
        context: getContext,
        builder: (_) {
          return const AlertDialog(
            title: Text('data'),
          );
        });
  }

  home() {
    child = const Home();
    notifyListeners();
  }

  addNew(ViewState viewState, {UserObject? user, PetObject? pet}){
    child = AddNew(viewState: viewState, user: user, pet: pet,);
    notifyListeners();
  }

  appointments() {
    child = const AppointmentsView();
    notifyListeners();
  }

   buildBody() {
    child = BuildBody();
    notifyListeners();
  }

  // view clients
   clients() {
    child = const ClientsView();
    notifyListeners();
  }

   viewPet(PetObject? pet){
    child = ViewPet(pet: pet,);
    notifyListeners();
  }
}
