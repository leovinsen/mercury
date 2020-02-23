import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleWebView extends StatefulWidget {
  static const route = '/webview';

  final String articleUrl;

  const NewsArticleWebView({Key key, @required this.articleUrl})
      : assert(articleUrl != null),
        super(key: key);

  @override
  _NewsArticleWebViewState createState() => _NewsArticleWebViewState();
}

class _NewsArticleWebViewState extends State<NewsArticleWebView> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          _loading ? LinearProgressIndicator() : Container(),
          Flexible(
            child: WebView(
              initialUrl: widget.articleUrl,
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
}

class NewsArticleWebViewArguments {
  final String articleUrl;

  NewsArticleWebViewArguments(this.articleUrl);
}
