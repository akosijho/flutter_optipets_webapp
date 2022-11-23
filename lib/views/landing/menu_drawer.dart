import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.router.dart';
import 'package:flutter_optipets_webapp/views/landing/landing_page_view_model.dart';
import 'package:stacked/stacked.dart';

class MenuDrawer extends ViewModelWidget<LandingPageViewModel> {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LandingPageViewModel viewModel) {
    return Drawer(
      child: Container(
        color: Colors.white, //const Color(0xFF077BD7),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.blue,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Author',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    // fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF077BD7),
                          // fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: Colors.blueGrey.shade200,
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF077BD7),
                          // fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: Colors.blueGrey.shade200,
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'History',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF077BD7),
                          // fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: Colors.blueGrey.shade200,
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        viewModel.applicationViewModel.navigationService.pop();
                        await viewModel.checkLogged();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF077BD7),
                          // fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Copyright © 2022 | Bohol Veterinary Clinic',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
