import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';

class MyThemes {
  static ThemeData light = ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        dividerColor: MyColors.black,
        toggleableActiveColor: MyColors.facebook,
        secondaryHeaderColor: MyColors.facebook,
        disabledColor: MyColors.gray3,
        primaryColor: MyColors.coverColor,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minWidth: 10,
            height: 10),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            MyColors.primaryColor,
          ),
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          trackColor: MaterialStateProperty.all(Colors.grey.shade300),
          interactive: true,
          thickness: MaterialStateProperty.all(8.0),
          radius: Radius.zero,
        ),
        textTheme: const TextTheme(
          headline3:  TextStyle(
            fontWeight: FontWeight.w700,
          ),
         
        ),
      );
}
