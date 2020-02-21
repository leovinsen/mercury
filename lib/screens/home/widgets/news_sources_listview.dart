import 'package:flutter/material.dart';
import 'package:news_reader/model/news_source.dart';
import 'package:news_reader/utils/string_utils.dart';

import 'news_source_avatar.dart';
import 'news_source_information.dart';
import 'news_source_separator.dart';

class NewsSourcesListView extends StatelessWidget {
  final List<NewsSource> newsSources;

  const NewsSourcesListView({Key key, this.newsSources})
      : assert(newsSources != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => NewsSourceSeparator(),
      itemCount: newsSources.length,
      itemBuilder: (_, index) {
        final newsSource = newsSources[index];
        return Container(
          height: 80.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NewsSourceAvatar(
                avatar: Text(
                  StringUtils.getAbbreviation(newsSource.name),
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: NewsSourceInformation(
                  sourceName: newsSource.name,
                  sourceDescription: newsSource.description,
                ),
              ),
            ],
          ),
        );
      },
      padding: const EdgeInsets.all(20.0),
    );
  }
}
