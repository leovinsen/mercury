import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/ic_launcher.png',
          height: 250,
          width: 250,
        ),
        Text(
          'Mercury',
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 4.0,
          width: 200.0,
          color: Colors.black,
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 3.0,
          width: 190.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
