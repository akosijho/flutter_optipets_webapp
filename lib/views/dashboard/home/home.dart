import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home/widgets/dash_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final _gap = const SizedBox(
    width: 16,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const DashTile(
              icon: Icons.people,
              numbers: "12345",
              description: "Clients",
            ),
            _gap,
            const DashTile(
              icon: Icons.pets,
              numbers: "12345",
              description: "Pets",
            ),
                _gap,
            const DashTile(
              icon: Icons.schedule,
              numbers: "12345",
              description: "Appointments",
            ),
                _gap,
            const DashTile(
              icon: Icons.monetization_on_rounded,
              numbers: "12345.00",
              description: "Sales As of yesterday",
            ),
          ])),
    );
  }
}
