import 'package:flutter/material.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/screens/root/widgets/favorite_articles_listview.dart';
import 'package:mercury/widgets/my_circular_progress_indicator.dart';

class FavoriteArticlesScreen extends StatelessWidget {
  static const appbarTitle = "Your Favorites";

  final ArticleDao dao;

  const FavoriteArticlesScreen({Key key, this.dao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dao.findAll(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final articles = snapshot.data;
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: articles.length > 0
                ? FavoriteArticlesListView(
                    articles: articles,
                  )
                : Text(
                    'Find an article you like and tap the love button!',
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
          );
        }

        return MyCircularProgressIndicator();
      },
    );
  }
}
