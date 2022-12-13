import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:stacked/stacked.dart';

class DashViews extends ViewModelWidget<HomeViewModel>{
   const DashViews({Key? key,}) : super(key: key);
  
  // final Widget? child;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      color: Colors.white60,
      padding: const EdgeInsets.fromLTRB(4,4,16,0),
      child: viewModel.child!
    );
  }
}