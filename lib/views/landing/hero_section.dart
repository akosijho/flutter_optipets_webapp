import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.screenSize});

  // screensize from parent widget
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return screenSize.width < 800
        ? Container(
            width: screenSize.width,
            height: 560,
            color: MyColors.coverColor,
          )
        : Container(
            width: screenSize.width,
            height: 560,
            color: MyColors.coverColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.width /2.05,
                    color: Colors.white,
                  ),
                  Container(
                    width: screenSize.width /2.05,
                    color: Colors.white,
                  ),
                ],
              ),),
          );
  }
}
