import 'package:flutter_test/flutter_test.dart';
import 'package:news_reader/main.dart';
import 'package:news_reader/service/sources_api_service.dart';

void main(){

  Main();
  test('Testing Sources API', () async {
    var sourcesApi = SourcesApiService();
    var sources = await sourcesApi.getAll();
    expect(sources.length, isNot(0));
    print(sources[0]);
  });
}