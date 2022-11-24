// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/appointments/appointments_view.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home/home.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController();

  Widget? child =  AddNew();
  UserObject? user;

  void init() async {
    setBusy(true);
    // check if a user is currently logged in
    await applicationViewModel.getFirebaseUser();
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

  addNew() {
    child = AddNew();
  }

  appointments() {
    child = const AppointmentsView();
    notifyListeners();
  }
}
