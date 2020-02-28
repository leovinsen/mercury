import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FavoriteButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      color: Colors.black,
      onPressed: onPressed,
    );
  }
  
}
