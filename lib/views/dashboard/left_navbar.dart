import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/buttons.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

class LeftNavBar extends ViewModelWidget<HomeViewModel> {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
        width: 200,
        height: 768,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          // shape: BoxShape.rectangle,
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(8),
          //     bottomLeft: Radius.circular(8))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ImageNetwork(
              image: 'assets/${SvgIcons.logo}',
              height: 104,
              width: 104,
              fitAndroidIos: BoxFit.fill,
              fitWeb: BoxFitWeb.fill,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'optipets',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            leftNavButton(
                function: viewModel.home, icon: Icons.home, label: 'Home'),
            leftNavButton(
                function: viewModel.addNew, icon: Icons.add, label: 'New'),
            leftNavButton(
                function: viewModel.appointments,
                icon: Icons.add,
                label: 'Appointments'),
            leftNavButton(function: prints, icon: Icons.add, label: 'button'),
            leftNavButton(
                function: () async {
                  await viewModel.auth.signOut();
                  await ApplicationViewModel()
                      .navigationService
                      .pushReplacementNamed(Routes.login);
                },
                icon: Icons.logout_outlined,
                label: 'Sign Out'),
          ],
        ));
  }

  void prints() {
    showDialog(
        context: getContext,
        builder: (_) {
          return const AlertDialog(
            content: Text('data'),
          );
        });
  }
}
