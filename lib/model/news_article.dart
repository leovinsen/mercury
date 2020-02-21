import 'package:json_annotation/json_annotation.dart';
import 'package:to_string/to_string.dart';

part 'news_article.g.dart';

@JsonSerializable()
@ToString(
  prettyPrint: true
)
class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsArticle(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);

  @override
  String toString() => _$NewsArticleToString(this);
}
