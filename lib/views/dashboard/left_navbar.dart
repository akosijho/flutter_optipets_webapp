import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/utils/svg_icons.dart';
import 'package:flutter_optipets_webapp/views/dashboard/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SvgPicture.asset(
              SvgIcons.logo,
              width: 104,
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
            leftNavButton(function: prints, icon: Icons.add),
          ],
        ));
  }

  void prints() {
    showDialog(
        context: getContext,
        builder: (_) {
          return const AlertDialog(
            title: const Text('data'),
          );
        });
  }
}
