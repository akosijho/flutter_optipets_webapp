// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:js' as js;

class BottomBarColumn extends StatelessWidget {
  final String heading, s1, s1Link, s2, s2Link, s3, s3Link;
  final Size currentSize;

  const BottomBarColumn({
    Key? key,
    required this.currentSize,
    required this.heading,
    required this.s1,
    required this.s1Link,
    required this.s2,
    required this.s2Link,
    required this.s3,
    required this.s3Link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: currentSize.width < 800 ? 16 : 18,
              color: Colors.blueGrey[100],
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          s1Link.isNotEmpty ? InkWell(
            onTap: () {
              js.context.callMethod('open', [s1Link]);
            },
            child: Text(
              s1,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ) :  Text(
              s1,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          const SizedBox(height: 10),
           s2Link.isNotEmpty ? InkWell(
            onTap: () {
              js.context.callMethod('open', [s2Link]);
            },
            child: Text(
              s2,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ) :  Text(
              s2,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          const SizedBox(height: 10),
          s3Link.isNotEmpty ? InkWell(
            onTap: () {
              js.context.callMethod('open', [s3Link]);
            },
            child: Text(
              s3,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ) :  Text(
              s3,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
