import 'package:flutter/material.dart';

class DashViews extends StatelessWidget{
  const DashViews({Key? key, this.child }) : super(key: key);
  
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: child
    );
  }
}