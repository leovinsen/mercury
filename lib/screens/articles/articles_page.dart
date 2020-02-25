import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/articles/articles_bloc_commons.dart';
import 'package:news_reader/screens/articles/widgets/article_searchbar.dart';
import 'package:news_reader/screens/articles/widgets/news_articles_listview.dart';
import 'package:news_reader/widgets/my_circular_progress_indicator.dart';

class ArticlesPage extends StatefulWidget {
  static const route = '/articles';

  final String newsSourceId;

  const ArticlesPage({Key key, @required this.newsSourceId})
      : assert(newsSourceId != null),
        super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  TextEditingController _textController;
  Timer _searchDelayTimer;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ArticleSearchBar(
          textController: _textController,
          onTextChanged: _searchAfterDelay,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (_, state) {
            if (state is InitialArticlesState) {
              BlocProvider.of<ArticlesBloc>(context)
                  .add(LoadArticlesBySource(widget.newsSourceId, ""));
              return Center(
                child: MyCircularProgressIndicator(),
              );
            }
            if (state is LoadingNewArticles) {
              return Center(
                child: MyCircularProgressIndicator(),
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
      ),
    );
  }

  void _searchAfterDelay(String value) {
    _searchDelayTimer?.cancel();

    _searchDelayTimer = Timer(
      Duration(milliseconds: 750),
      () => BlocProvider.of<ArticlesBloc>(context)
          .add(LoadArticlesBySource(widget.newsSourceId, value)),
    );
  }
}

class ArticlesPageArguments {
  final String newsSourceId;

  ArticlesPageArguments(this.newsSourceId);
}
