import 'package:json_annotation/json_annotation.dart';
import 'package:to_string/to_string.dart';

part 'news_article.g.dart';

@JsonSerializable()
@ToString(
  prettyPrint: true
)
class NewsArticle {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsArticle(this.id, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content);

  // Not using the @JsonSerializable constructor because the API returns null as "null" 
  // factory NewsArticle.fromJson(Map<String, dynamic> json) => 
      // _$NewsArticleFromJson(json);

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
    json['id'] as int,
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] == 'null' ? null : json['url'] as String,
    json['urlToImage'] == 'null' ? null : json['urlToImage'] as String,
    json['publishedAt'] == null
        ? null
        : DateTime.parse(json['publishedAt'] as String),
    json['content'] as String,
  );

  factory NewsArticle.fromDB(Map<String, dynamic> map) => NewsArticle.fromJson(map);

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);

  Map<String, dynamic> toDB() => toJson();

  @override
  String toString() => _$NewsArticleToString(this);
}
