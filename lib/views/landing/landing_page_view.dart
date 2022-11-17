import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/views/landing/bottom_bar.dart';
import 'package:flutter_optipets_webapp/views/landing/landing_page_view_model.dart';
import 'package:flutter_optipets_webapp/views/landing/menu_drawer.dart';
import 'package:flutter_optipets_webapp/views/login/login_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // get screen size
    var screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    return ViewModelBuilder<LandingPageViewModel>.reactive(
        viewModelBuilder: () => LandingPageViewModel(),
        builder: (context, model, child) {
          model.onScreenSizeChange();
          return Scaffold(
            extendBodyBehindAppBar: false,
            // Drawer widget
            endDrawer: const MenuDrawer(),
            appBar: screenSize.width < 690
                // appbar for small screen
                ? AppBar(
                    backgroundColor: MyColors.coverColor,
                    elevation: 1,
                    // create hamburger icon for drawer
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white),
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            );
                          },
                        ),
                      ),
                    ],
                    title: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LandingPageView()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(SvgIcons.logo,
                                width: 48,
                                clipBehavior: Clip.antiAlias,
                                color: Colors.white),
                            const SizedBox(width: 8),
                            const Center(
                                child: Text("optipets",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                  )
                : PreferredSize(
                    preferredSize: Size(screenSize.width, 72),
                    child: Container(
                      color: MyColors.coverColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 56, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LandingPageView()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(SvgIcons.logo,
                                        width: 64,
                                        clipBehavior: Clip.antiAlias,
                                        color: Colors.white),
                                    const SizedBox(width: 8),
                                    const Center(
                                        child: Text("optipets",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white))),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent)),
                                  onPressed: () {},
                                  child: const Center(
                                      child: Text("Download",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white))),
                                ),
                                const SizedBox(width: 24),
                                TextButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent)),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginView()),
                                    );
                                  },
                                  child: const Center(
                                      child: Text("Login",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: const [
                  BottomBar()
                ],
              ),
            ),
          );
        });
  }
}
