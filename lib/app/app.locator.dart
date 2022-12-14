// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';

import '../core/services/firebase_services/firbase_firestore/firestore_service.dart';
import '../core/services/firebase_services/firbase_firestore/firestore_service_impl.dart';
import '../core/services/firebase_services/firebase_auth.dart';
import '../core/services/firebase_services/firebase_auth_impl.dart';
import '../core/services/navigation/navigation.dart';
import '../core/services/navigation/navigation_impl.dart';
import '../views/dashboard/home_view_mode..dart';
import 'application_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton<ApplicationViewModel>(
      () => ApplicationViewModel());
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  locator.registerLazySingleton<Auth>(() => AuthImpl());
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
  locator.registerLazySingleton<FirestoreService>(() => FirestoreServiceImpl());
}
