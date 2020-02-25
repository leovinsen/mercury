import 'package:flutter/material.dart';

class NewsArticleImage extends StatelessWidget {

  final height = 70.0;
  final width = 90.0;

  final String imageUrl;

  const NewsArticleImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              scale: 1.0,
              repeat: ImageRepeat.noRepeat,
              width: width,
              height: height,
              fit: BoxFit.cover,
            )
          : Container(
              width: width,
              height: height,
              color: Colors.grey,
            ),
    );
  }
}
