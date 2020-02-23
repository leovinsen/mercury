import 'package:flutter/material.dart';

class NewsArticleImage extends StatelessWidget {
  final String imageUrl;

  const NewsArticleImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              scale: 1.0,
              repeat: ImageRepeat.noRepeat,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            )
          : Container(
              width: 100,
              height: 80,
              color: Colors.grey,
            ),
    );
  }
}
