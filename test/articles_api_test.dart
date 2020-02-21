import 'package:flutter_test/flutter_test.dart';
import 'package:news_reader/main.dart';
import 'package:news_reader/service/articles_api_service.dart';

void main(){

  Main();
  test('Testing Articles API', () async {
    var articlesApi = ArticlesApiService();
    var sources = await articlesApi.getBySourceId("abc-news");
    expect(sources.length, isNot(0));
    print(sources[0]);
  });
}