import 'package:json_annotation/json_annotation.dart';
import 'package:to_string/to_string.dart';

part 'news_source.g.dart';

@JsonSerializable()
@ToString()
class NewsSource {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  NewsSource(this.id, this.name, this.description, this.url, this.category, this.language, this.country);

  factory NewsSource.fromJson(Map<String,dynamic>  json) => _$NewsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceToJson(this);

  @override
  String toString() => _$NewsSourceToString(this);
  

}