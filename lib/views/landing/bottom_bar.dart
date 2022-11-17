import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_optipets_webapp/views/landing/bottom_bar_column.dart';
import 'package:flutter_optipets_webapp/views/landing/info_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

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
                  children: const [
                    BottomBarColumn(
                      heading: 'Contact Us',
                      s1: '09462339892',
                      s1Link: '',
                      s2: 'Facebook',
                      s2Link: 'https://web.facebook.com/boholveteclinic',
                      s3: '',
                      s3Link: '',
                    ),
                    // BottomBarColumn(
                    //   heading: 'HELP',
                    //   s1: 'Payment',
                    //   s1Link: '',
                    //   s2: 'Cancellation',
                    //   s2Link: '',
                    //   s3: 'FAQ',
                    //   s3Link: '',
                    // ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Facebook',
                      s1Link: 'https://twitter.com/alamin_karno',
                      s2: 'Facebook',
                      s2Link: 'https://www.facebook.com/alamin.karnoOfficial',
                      s3: 'YouTube',
                      s3Link: 'https://youtube.com/alaminkarno',
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
                      text: 'alamin.karno@outlook.com',
                      isEmail: true,
                    ),
                    SizedBox(height: 10),
                    InfoText(
                      type: 'Address',
                      text:
                          'Bool District, Tagbilaran City, Bohol',
                      isAddress: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.white60,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    var addressUrl = 'https://github.com/alamin-karno';
                    try {
                      await launchUrl(Uri.parse(addressUrl));
                    } catch (e) {
                      await Clipboard.setData(ClipboardData(text: addressUrl));
                      debugPrint('Address Copied');
                    }
                  },
                  child: Text(
                    'Copyright © 2022 | Bohol Veterinary Clinic',
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
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
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s1Link: '',
                      s2: 'About Us',
                      s2Link: '',
                      s3: 'Careers',
                      s3Link: '',
                    ),
                    // const BottomBarColumn(
                    //   heading: 'HELP',
                    //   s1: 'Payment',
                    //   s1Link: '',
                    //   s2: 'Cancellation',
                    //   s2Link: '',
                    //   s3: 'FAQ',
                    //   s3Link: '',
                    // ),
                    const BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s1Link: 'https://twitter.com/alamin_karno',
                      s2: 'Facebook',
                      s2Link: 'https://www.facebook.com/alamin.karnoOfficial',
                      s3: 'YouTube',
                      s3Link: 'https://youtube.com/alaminkarno',
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
                          text: 'alamin.karno@outlook.com',
                          isEmail: true,
                        ),
                        SizedBox(height: 10),
                        InfoText(
                          type: 'Address',
                          text:
                              'Bool District, Tagbilaran City, Bohol',
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
                InkWell(
                  onTap: (){
                    js.context.callMethod('open', ['https://stackoverflow.com/questions/ask']);
                  },
                  child: Text(
                    'Copyright © 2022 | Bohol Veterinary Clinic',
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
