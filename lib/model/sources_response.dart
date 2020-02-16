import 'package:json_annotation/json_annotation.dart';
import 'package:to_string/to_string.dart';

import 'news_source.dart';

part 'sources_response.g.dart';

@JsonSerializable()
@ToString()
class SourcesResponse {
  final String status;
  final List<NewsSource> sources;

  SourcesResponse(this.status, this.sources);

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesResponseToJson(this);

  @override
  String toString() => _$SourcesResponseToString(this);
  
}
