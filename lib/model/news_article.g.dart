// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) {
  return NewsArticle(
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] as String,
    json['urlToImage'] as String,
    json['publishedAt'] == null
        ? null
        : DateTime.parse(json['publishedAt'] as String),
    json['content'] as String,
  );
}

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$NewsArticleToString(NewsArticle o) {
  return """NewsArticle{
  author: ${o.author},
  title: ${o.title},
  description: ${o.description},
  url: ${o.url},
  urlToImage: ${o.urlToImage},
  publishedAt: ${o.publishedAt},
  content: ${o.content},
}""";
}
