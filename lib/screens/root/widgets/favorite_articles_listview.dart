import 'package:flutter/material.dart';
import 'package:mercury/model/news_article.dart';
import 'package:mercury/screens/articles/widgets/news_article_widget.dart';

class FavoriteArticlesListView extends StatelessWidget {
  final List<NewsArticle> articles;

  const FavoriteArticlesListView({Key key, @required this.articles})
      : assert(articles != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => SizedBox(height: 20.0),
      itemBuilder: (_, index) {
        return NewsArticleWidget(article: articles[index]);
      },
      itemCount: articles.length,
    );
  }
}
