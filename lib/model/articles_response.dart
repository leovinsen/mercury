import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/model/news_article.dart';
import 'package:to_string/to_string.dart';

part 'articles_response.g.dart';

@JsonSerializable()
@ToString()
class ArticlesResponse {
  final String status;
  final int totalResults;
  final List<NewsArticle> articles;

  const ArticlesResponse(this.status, this.articles, this.totalResults);

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);

  @override
  String toString() => _$ArticlesResponseToString(this);
}
