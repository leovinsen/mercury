// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSource _$NewsSourceFromJson(Map<String, dynamic> json) {
  return NewsSource(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['url'] as String,
    json['category'] as String,
    json['language'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$NewsSourceToJson(NewsSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$NewsSourceToString(NewsSource o) {
  return """NewsSource{id: ${o.id}, name: ${o.name}, description: ${o.description}, url: ${o.url}, category: ${o.category}, language: ${o.language}, country: ${o.country}}""";
}
