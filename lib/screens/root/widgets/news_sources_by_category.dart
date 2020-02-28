import 'package:flutter/material.dart';
import 'package:news_reader/model/news_source.dart';

import 'news_sources_listview.dart';

class NewsSourcesByCategory extends StatelessWidget {
  final Map<String, List<NewsSource>> newsSourcesMap;

  const NewsSourcesByCategory({Key key, @required this.newsSourcesMap})
      : assert(newsSourcesMap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List languages = newsSourcesMap.keys.toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: languages.length,
      itemBuilder: (_, index) {
        final language = languages[index];
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      language,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
                children: <Widget>[
                  NewsSourcesListView(
                    newsSources: newsSourcesMap[language],
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
