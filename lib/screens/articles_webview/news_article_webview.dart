import 'package:flutter/material.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/global.dart';
import 'package:mercury/model/news_article.dart';
import 'package:mercury/screens/articles_webview/widgets/favorite_button.dart';
import 'package:mercury/widgets/simple_alert_dialog.dart';
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

  @override
  void initState() {
    super.initState();
    sl.get<ArticleDao>().findByUrl(widget.article.url).then((article) {
      _isSaved = article != null;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          widget.article.url,
          style: Theme.of(context).textTheme.body1,
        ),
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
      await sl.get<ArticleDao>().add(widget.article);
      _isSaved = true;
      setState(() {});
    } on DatabaseException {
      showDialog(
        context: context,
        builder: (_) =>
            SimpleAlertDialog(text: 'Failed to favorite article (DB ERROR)'),
      );
    }
  }

  void _unfavorite() async {
    try {
      if (await sl.get<ArticleDao>().deleteByUrl(widget.article.url) == 1) {
        _isSaved = false;
        setState(() {});
      } else {
        showDialog(
          context: context,
          builder: (_) =>
              SimpleAlertDialog(text: 'Failed to unfavorite article'),
        );
      }
    } on DatabaseException {
      showDialog(
        context: context,
        builder: (_) =>
            SimpleAlertDialog(text: 'Failed to unfavorite article (DB ERROR)'),
      );
    }
  }
}

class NewsArticleWebViewArguments {
  final NewsArticle article;

  NewsArticleWebViewArguments(this.article);
}
