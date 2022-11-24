// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyImage extends StatelessWidget {
  const MyImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) {
        final html.Element htmlElement = html.DivElement()
          // ..other props
          ..style.width = '100%'
          ..style.height = '100%'
          ..children = [html.ImageElement()
          ..src = imageUrl
          // ..style.width = '72px'
          // ..style.height = '72px'
          ..style.width = '100%'
          ..style.height = '100%'
          ];
        return htmlElement;
      },
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}
