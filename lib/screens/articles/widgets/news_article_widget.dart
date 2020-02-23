import 'package:flutter/material.dart';
import 'package:news_reader/model/news_article.dart';
import 'package:news_reader/screens/articles/widgets/news_article_image.dart';
import 'package:news_reader/screens/articles/widgets/news_article_publication_time.dart';
import 'package:news_reader/screens/articles/widgets/news_article_title.dart';
import 'package:news_reader/screens/articles_webview/news_article_webview.dart';

class NewsArticleWidget extends StatelessWidget {
  final NewsArticle article;

  const NewsArticleWidget({Key key, @required this.article})
      : assert(article != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        NewsArticleWebView.route,
        arguments: NewsArticleWebViewArguments(article.url),
      ),
      child: Row(
        children: <Widget>[
          NewsArticleImage(imageUrl: article.urlToImage),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NewsArticleTitle(title: article.title),
                NewsArticlePublicationTime(dateTime: article.publishedAt),
              ],
            ),
          )
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     color: Color(0xFFFDFDFD),
    //     border: Border.all(
    //       color: Color(0xFFF1F1F1),
    //     ),
    //   ),
    // );
  }
}