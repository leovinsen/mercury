import 'package:flutter/material.dart';
import 'package:mercury/model/news_source.dart';
import 'package:mercury/screens/articles/articles_page.dart';

import 'news_source_information.dart';

class NewsSourcesListView extends StatelessWidget {
  final List<NewsSource> newsSources;

  const NewsSourcesListView({Key key, this.newsSources})
      : assert(newsSources != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (_, index) => SizedBox(height: 20.0,),
      itemCount: newsSources.length,
      itemBuilder: (_, index) {
        final newsSource = newsSources[index];
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            ArticlesPage.route,
            arguments: ArticlesPageArguments(newsSource.id),
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFFDFDFD),
              border: Border.all(
                color: Color(0xFFF1F1F1),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: NewsSourceInformation(
                    sourceName: newsSource.name,
                    sourceDescription: newsSource.description,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
