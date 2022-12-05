import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/app/application_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/buttons.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/view_state.dart';
import 'package:image_network/image_network.dart';
import 'package:stacked/stacked.dart';

class LeftNavBar extends ViewModelWidget<HomeViewModel> {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
        width: 200,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: ClipRRect(
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
              PopupMenuButton(
                position: PopupMenuPosition.under,
                child: leftNavButton(icon: Icons.add, label: 'New'),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: popupMenuItem(text: 'New Client'),
                    onTap: () {
                      viewModel.addNew(ViewState.newClient, user: null);
                    },
                  ),
                  PopupMenuItem(
                      child: popupMenuItem(
                    text: 'New Staff',
                  ),
                   onTap: () {
                      viewModel.addNew(ViewState.newStaff, user: null);
                    },)
                ],
              ),
              leftNavButton(
                  function: viewModel.appointments,
                  icon: Icons.add,
                  label: 'Appointments'),
              leftNavButton(function: viewModel.clients, icon: Icons.people, label: 'Clients'),
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
          ),
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

  ListTile popupMenuItem({String text = '', IconData? icon}) {
    return ListTile(
        leading: Icon(icon),
        dense: true,
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ));
  }
}
