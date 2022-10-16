import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: ApplicationViewModel)
class ApplicationViewModel extends BaseViewModel{

  // key for form validation
  final formGlobalKey = GlobalKey<FormState>();
}