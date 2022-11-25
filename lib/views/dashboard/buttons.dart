import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';

Widget leftNavButton({required IconData icon, required String label,  dynamic function}) {
  return Material(
      color: Theme.of(getContext).primaryColor,
      child: InkWell(
          onTap: function,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.white.withOpacity(0.6), width: 0.5)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children:  [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                      child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,

                    ),
                  )),
                ],
              ))
          ));
}
