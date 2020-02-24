import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/articles/articles_bloc_commons.dart';
import 'package:news_reader/screens/articles/widgets/news_articles_listview.dart';

class ArticlesPage extends StatelessWidget {
  static const route = '/articles';

  final String newsSourceId;

  const ArticlesPage({Key key, @required this.newsSourceId})
      : assert(newsSourceId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (_, state) {
          if (state is InitialArticlesState) {
            BlocProvider.of<ArticlesBloc>(context)
                .add(LoadArticlesBySource(newsSourceId, ""));
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ArticlesLoaded) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: NewsArticlesListView(
                articles: state.articles,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class ArticlesPageArguments {
  final String newsSourceId;

  ArticlesPageArguments(this.newsSourceId);
}
