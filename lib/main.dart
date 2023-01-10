// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/firebase_options.dart';
import 'package:flutter_optipets_webapp/utils/my_themes.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/landing/landing_page_view.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  // remove hash from <base href>
  setPathUrlStrategy(); 

  // set session persistence
  FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
    return GetMaterialApp(
      onInit: () async => await applicationViewModel.getFirebaseUser(),
      title: 'Optipets | Management',
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: MyThemes.light,
      debugShowCheckedModeBanner: false,
      home: const LandingPageView()
    );
  }
}
