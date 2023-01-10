// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/views/landing/bottom_bar_column.dart';
import 'package:flutter_optipets_webapp/views/landing/info_text.dart';
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:flutter_optipets_webapp/views/landing/style.dart';
import 'package:image_network/image_network.dart';

// import 'widgets.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.currentSize,
  }) : super(key: key);

  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);
  final Size currentSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: const LinearGradient(
          colors: [gradientStartColor, gradientEndColor],
          begin: FractionalOffset(0.2, 0.2),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Expanded(
                       child: BottomBarColumn(
                        currentSize: currentSize,
                        heading: 'Contact Us',
                        s1: '09462339892',
                        s1Link: '',
                        s2: 'Facebook',
                        s2Link: 'https://web.facebook.com/boholveteclinic',
                        s3: '',
                        s3Link: '',
                                         ),
                     ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              html.window.open(
                                  'https://web.facebook.com/boholveteclinic',
                                  "_blank");
                            },
                            child: const ImageNetwork(
                              image: 'assets/${SvgIcons.bvcLogo}',
                              fitWeb: BoxFitWeb.fill,
                              fitAndroidIos: BoxFit.fill,
                              width: 104,
                              height: 104,
                              curve: Curves.easeOut,
                              // const MyImage(imageUrl: SvgIcons.bvcLogo),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () => js.context.callMethod(
                                'open', ['https://optipets.web.app']),
                            child: const ImageNetwork(
                              image: 'assets/${SvgIcons.appIcon}',
                              fitWeb: BoxFitWeb.fill,
                              fitAndroidIos: BoxFit.fill,
                              width: 104,
                              height: 104,
                              curve: Curves.easeOut,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white60,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(
                      currentSize: currentSize,
                      type: 'Email',
                      text: 'boholveterinaryclinic@gmail.com',
                      isEmail: true,
                    ),
                    const SizedBox(height: 10),
                    InfoText(
                      currentSize: currentSize,
                      type: 'Address',
                      text: 'Bool District, Tagbilaran City, Bohol',
                      isAddress: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.white60,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2022 | Bohol Veterinary Clinic',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomBarColumn(
                      currentSize: currentSize,
                      heading: 'Contact Us',
                      s1: '09462339892',
                      s1Link: '',
                      s2: 'Facebook',
                      s2Link: 'https://web.facebook.com/boholveteclinic',
                      s3: '',
                      s3Link: '',
                    ),
                    const SizedBox(width: 48,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: buttonStyle,
                          onPressed: () => js.context.callMethod('open',
                              ['https://web.facebook.com/boholveteclinic']),
                          child: const ImageNetwork(
                            image: 'assets/${SvgIcons.bvcLogo}',
                            fitWeb: BoxFitWeb.fill,
                            fitAndroidIos: BoxFit.fill,
                            width: 104,
                            height: 104,
                            curve: Curves.easeOut,
                            // const MyImage(imageUrl: SvgIcons.bvcLogo),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () => js.context
                              .callMethod('open', ['https://optipets.web.app']),
                          child: const ImageNetwork(
                            image: 'assets/${SvgIcons.appIcon}',
                            fitWeb: BoxFitWeb.fill,
                            fitAndroidIos: BoxFit.fill,
                            width: 104,
                            height: 104,
                            curve: Curves.easeOut,
                            // const MyImage(imageUrl: SvgIcons.bvcLogo),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32,),
                    Container(
                      color: Colors.white60,
                      width: 2,
                      height: 150,
                    ),
                    const SizedBox(width: 48,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        InfoText(
                          currentSize: currentSize,
                          type: 'Email',
                          text: 'boholveterinaryclinic@gmail.com',
                          isEmail: true,
                        ),
                        const SizedBox(height: 10),
                        InfoText(
                          currentSize: currentSize,
                          type: 'Address',
                          text: 'Bool District, Tagbilaran City, Bohol',
                          isAddress: true,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white60,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2022 | Bohol Veterinary Clinic',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
