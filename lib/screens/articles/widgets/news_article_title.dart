import 'package:flutter/material.dart';

class NewsArticleTitle extends StatelessWidget {
  final String title;

  const NewsArticleTitle({Key key, @required this.title})
      : assert(title != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: Theme.of(context).textTheme.title,
      overflow: TextOverflow.ellipsis,
    );
  }
}
