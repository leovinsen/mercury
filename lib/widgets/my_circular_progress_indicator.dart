import 'package:flutter/material.dart';

/// A circular progress indicator set to have a default color of black
/// App theme primarySwatch is set to white, which causes all progress indicator to become invisible because they are white
class MyCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }
}
