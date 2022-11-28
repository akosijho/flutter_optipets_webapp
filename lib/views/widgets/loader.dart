import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget{
  const Loader({super.key});
  
  @override
  Widget build(BuildContext context) {
   return  Align(
    child: 
    Lottie.asset("images/heartbeat.json",
    width: 96,
    height: 96,
    frameRate: FrameRate(60),
    ),
  );
  }
}