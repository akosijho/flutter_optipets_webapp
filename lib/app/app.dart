import 'package:flutter_optipets_webapp/services/firebase_services/firebase_auth.dart';
import 'package:flutter_optipets_webapp/services/firebase_services/firebase_auth_impl.dart';
import 'package:flutter_optipets_webapp/services/navigation/navigation.dart';
import 'package:flutter_optipets_webapp/services/navigation/navigation_impl.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home.dart';
import 'package:flutter_optipets_webapp/views/login/login_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: LoginView, name: "login"),
  AdaptiveRoute(page: Home, name: "home"),
], dependencies: [
  LazySingleton(classType: ApplicationViewModel, asType: ApplicationViewModel),
  LazySingleton(classType: AuthImpl, asType: Auth),
  LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
])
class App {}