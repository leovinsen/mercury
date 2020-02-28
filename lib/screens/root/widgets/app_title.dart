import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Mercury',
          style:
              Theme.of(context).textTheme.display1.apply(color: Colors.black),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 2.0,
          width: 150.0,
          color: Colors.black,
        )
      ],
    );
  }
}
