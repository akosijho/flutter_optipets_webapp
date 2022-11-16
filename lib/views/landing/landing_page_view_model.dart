import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LandingPageViewModel extends BaseViewModel{

  var  screenSize = MediaQuery.of(getContext).size;

  void onScreenSizeChange(){
     debugPrint(screenSize.toString());
  }
}