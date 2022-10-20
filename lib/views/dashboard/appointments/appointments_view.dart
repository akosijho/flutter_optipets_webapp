import 'package:flutter/material.dart';

class AppointmentsView extends StatelessWidget {
  const  AppointmentsView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(child: Text('this is appointments')),
    );
  }
}
