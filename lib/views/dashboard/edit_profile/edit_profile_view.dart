import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/core/models/user_object.dart';
import 'package:flutter_optipets_webapp/views/dashboard/edit_profile/edit_profile_view_model.dart';
import 'package:stacked/stacked.dart';

class EditProfileView extends StatelessWidget{
  const EditProfileView({super.key, required this.profile});

  final UserObject profile;
  
  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<EditProfileViewModel>.reactive(
    viewModelBuilder: () => EditProfileViewModel(profile: profile) , 
    builder: (context, model, child) =>  SingleChildScrollView(
      child: Text(model.profile.uid!),
    ) );
  }

} 