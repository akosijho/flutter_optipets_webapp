import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel{
 
  EditProfileViewModel({required this.profile});

  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();

  final UserObject profile;

 
}