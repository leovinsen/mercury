import 'package:json_annotation/json_annotation.dart';
import 'package:mercury/database/article_schema.dart';
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

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);

  factory NewsArticle.fromDB(Map<String, dynamic> map) =>  NewsArticle(
    map[articleId] as int,
    map[articleAuthor] as String,
    map[articleTitle] as String,
    map[articleDescription] as String,
    map[articleUrl] as String,
    map[articleUrlToImage] as String,
    map[articlePublishedAt] == null
        ? null
        : DateTime.parse(map[articlePublishedAt] as String),
    map[articleContent] as String,
  );
  Map<String, dynamic> toDB() => <String, dynamic> {
    articleId: id,
    articleAuthor: author,
    articleTitle: title,
    articleDescription: description,
    articleUrl: url,
    articleUrlToImage: urlToImage,
    articlePublishedAt: publishedAt?.toIso8601String(),
    articleContent: content,
  };

  @override
  String toString() => _$NewsArticleToString(this);
}
