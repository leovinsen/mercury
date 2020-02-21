import 'package:flutter/material.dart';

class NewsSourceSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: Divider(
        indent: 5.0,
        endIndent: 5.0,
        color: Colors.black38,
      ),
    );
  }
}
