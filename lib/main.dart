// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/firebase_options.dart';
import 'package:flutter_optipets_webapp/utils/my_themes.dart';
import 'package:flutter_optipets_webapp/views/login/login_view.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  // usePathUrlStrategy();
  if (kIsWeb) {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Optipets | Management',
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: MyThemes.light,
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
