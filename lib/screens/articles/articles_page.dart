import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  static const route = '/articles';

  final String newsSourceId;

  const ArticlesPage({Key key, @required this.newsSourceId})
      : assert(newsSourceId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Articles Page, ID: $newsSourceId'),
    );
  }
}

class ArticlesPageArguments {
  final String newsSourceId;

  ArticlesPageArguments(this.newsSourceId);
}
