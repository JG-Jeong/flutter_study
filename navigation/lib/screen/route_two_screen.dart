import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(
          'argumentes = $arguments',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text('push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: Text('push replacement'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => RouteThreeScreen(),
                  ),
                  (route) => route.settings.name == '/');
            },
            child: Text('pushAndRemoveUntil'))
      ],
    );
  }
}
