import 'package:flutter/material.dart';

class UnfavoriteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UnfavoriteButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      color: Colors.red,
      onPressed: onPressed,
    );
  }
}
