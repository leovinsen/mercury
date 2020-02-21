// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) {
  return ArticlesResponse(
    json['status'] as String,
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : NewsArticle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['totalResults'] as int,
  );
}

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$ArticlesResponseToString(ArticlesResponse o) {
  return """ArticlesResponse{status: ${o.status}, totalResults: ${o.totalResults}, articles: ${o.articles}}""";
}
