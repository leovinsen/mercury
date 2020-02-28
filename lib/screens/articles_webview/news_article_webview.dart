import 'package:flutter/material.dart';
import 'package:news_reader/database/article_dao.dart';
import 'package:news_reader/database/database.dart';
import 'package:news_reader/model/news_article.dart';
import 'package:news_reader/screens/articles_webview/widgets/favorite_button.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widgets/unfavorite_button.dart';

class NewsArticleWebView extends StatefulWidget {
  static const route = '/webview';

  final NewsArticle article;

  const NewsArticleWebView({Key key, @required this.article})
      : assert(article != null),
        super(key: key);

  @override
  _NewsArticleWebViewState createState() => _NewsArticleWebViewState();
}

class _NewsArticleWebViewState extends State<NewsArticleWebView> {
  bool _loading = true;
  bool _isSaved = false;
  ArticleDao _articleDao;

  @override
  void initState() {
    super.initState();
    //TODO: Figure how to use get_it for DI
    DatabaseProvider.instance.db.then((db) async {
      _articleDao = ArticleDao(db);
      _isSaved = await _articleDao.findByUrl(widget.article.url) != null;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(widget.article.url, style: Theme.of(context).textTheme.body1,),
        actions: <Widget>[
          _isSaved
              ? UnfavoriteButton(
                  onPressed: _unfavorite,
                )
              : FavoriteButton(
                  onPressed: _favorite,
                )
        ],
      ),
      body: Column(
        children: <Widget>[
          _loading
              ? Container(
                  height: 3.0,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                )
              : Container(),
          Flexible(
            child: WebView(
              initialUrl: widget.article.url,
              onPageFinished: (str) {
                _loading = false;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  void _favorite() async {
    try {
      await _articleDao.add(widget.article);
      _isSaved = true;
      setState(() {});
    } on DatabaseException {
      ///Prevent errors when user spams the [FavoriteButton] due to multiple insertion queued 
      return;
    }
  }

  void _unfavorite() async {
    try {
      if (await _articleDao.deleteByUrl(widget.article.url) == 1) {
        _isSaved = false;
        setState(() {});
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text('Failed to unfavorite article'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      }
    } on DatabaseException {
      ///Prevent errors when user spams the [UnfavoriteButton] due to multiple deletes queued 
      return;
    }
  }
}

class NewsArticleWebViewArguments {
  final NewsArticle article;

  NewsArticleWebViewArguments(this.article);
}
