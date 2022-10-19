import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';

Widget leftNavButton({required IconData icon, required dynamic function}) {
  return Material(
      color: Theme.of(getContext).primaryColor,
      child: InkWell(
          onTap: function,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 0.5)),
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
                  const Center(
                      child: Text(
                    'New',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  )),
                ],
              ))
          ));
}
