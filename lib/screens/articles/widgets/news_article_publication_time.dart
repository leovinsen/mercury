import 'package:flutter/material.dart';
import 'package:news_reader/extensions/datetime_ext.dart';

class NewsArticlePublicationTime extends StatelessWidget {
  final DateTime dateTime;

  const NewsArticlePublicationTime({Key key, @required this.dateTime})
      : assert(dateTime != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      dateTime.toPrettyDDMMYYYY(),
      style: Theme.of(context).textTheme.caption,
    );
  }
}
