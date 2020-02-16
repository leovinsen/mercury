// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourcesResponse _$SourcesResponseFromJson(Map<String, dynamic> json) {
  return SourcesResponse(
    json['status'] as String,
    (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : NewsSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SourcesResponseToJson(SourcesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$SourcesResponseToString(SourcesResponse o) {
  return """SourcesResponse{status: ${o.status}, sources: ${o.sources}}""";
}
