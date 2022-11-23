// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:js' as js;

class InfoText extends StatelessWidget {
  final String type, text;
  final Size currentSize;
  final bool? isEmail, isAddress;
  const InfoText({
    Key? key,
    required this.currentSize,
    required this.type,
    required this.text,
    this.isEmail,
    this.isAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type : ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey[100],
          ),
        ),
        Flexible(
          child: isEmail != null && isEmail! ?  Text(
              text,
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: currentSize.width < 800 ? 14 : 16,
                color: Colors.white60,
              ),
            ) : isAddress !=null && isAddress! ? InkWell(
            onTap: () async {
             if (isAddress == true) {
                var addressUrl = 'https://goo.gl/maps/hnMjc745HYA44Skd7';
                try {
                  js.context.callMethod('open', [addressUrl]);
                } catch (e) {
                  await Clipboard.setData(ClipboardData(text: addressUrl));
                  debugPrint('Address Copied');
                }
              }
            },
            child: Text(
              text,
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: currentSize.width < 800 ? 14 : 16,
                color: Colors.white60,
              ),
            ),
          ) : Container(),
        ),
      ],
    );
  }
}
