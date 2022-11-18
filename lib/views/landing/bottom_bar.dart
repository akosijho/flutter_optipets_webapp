// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_image.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/views/landing/bottom_bar_column.dart';
import 'package:flutter_optipets_webapp/views/landing/info_text.dart';
import 'dart:js' as js;

import 'package:flutter_optipets_webapp/views/landing/style.dart';

// import 'widgets.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);

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
                    const BottomBarColumn(
                      heading: 'Contact Us',
                      s1: '09462339892',
                      s1Link: '',
                      s2: 'Facebook',
                      s2Link: 'https://web.facebook.com/boholveteclinic',
                      s3: '',
                      s3Link: '',
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 88,
                          height: 72,
                          child: TextButton(
                            style: buttonStyle,
                            onPressed: () => js.context.callMethod('open',
                                ['https://web.facebook.com/boholveteclinic']),
                            child: const MyImage(imageUrl: SvgIcons.bvcLogo),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 88,
                          height: 72,
                          child: TextButton(
                            style: buttonStyle,
                            onPressed: () => js.context
                                .callMethod('open', ['https://optipets.web.app']),
                            child: const MyImage(imageUrl: SvgIcons.appIcon),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white60,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoText(
                      type: 'Email',
                      text: 'boholveterinaryclinic@gmail.com',
                      isEmail: true,
                    ),
                    SizedBox(height: 10),
                    InfoText(
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
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BottomBarColumn(
                      heading: 'Contact Us',
                      s1: '09462339892',
                      s1Link: '',
                      s2: 'Facebook',
                      s2Link: 'https://web.facebook.com/boholveteclinic',
                      s3: '',
                      s3Link: '',
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 88,
                          height: 72,
                          child: TextButton(
                            style: buttonStyle,
                            onPressed: () => js.context.callMethod('open',
                                ['https://web.facebook.com/boholveteclinic']),
                            child: const MyImage(imageUrl: SvgIcons.bvcLogo),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 88,
                          height: 72,
                          child: TextButton(
                            style: buttonStyle,
                            onPressed: () => js.context
                                .callMethod('open', ['https://optipets.web.app']),
                            child: const MyImage(imageUrl: SvgIcons.appIcon),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white60,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        InfoText(
                          type: 'Email',
                          text: 'boholveterinaryclinic@gmail.com',
                          isEmail: true,
                        ),
                        SizedBox(height: 10),
                        InfoText(
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
