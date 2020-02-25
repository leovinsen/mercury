import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
          ? FadeInImage.memoryNetwork(
              image: imageUrl,
              placeholder: kTransparentImage,
              repeat: ImageRepeat.noRepeat,
              width: width,
              height: height,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/placeholder_no_image.png',
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
    );
  }
}
