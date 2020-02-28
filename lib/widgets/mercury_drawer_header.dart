import 'package:flutter/material.dart';

class MercuryDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Mercury',
            style: Theme.of(context).textTheme.title.apply(color: Colors.white),
          ),
          Text(
            'Your news portal.',
            style:
                Theme.of(context).textTheme.subtitle.apply(color: Colors.white),
          )
        ],
      ),
    );
  }
}
