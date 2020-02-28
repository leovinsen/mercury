import 'package:flutter_test/flutter_test.dart';
import 'package:mercury/exception/articles_api_exception.dart';
import 'package:mercury/main.dart';
import 'package:mercury/service/articles_api_service.dart';

void main() {
  Main();

  var articlesApi = ArticlesApiService();
  test('Testing Articles API success condition', () async {
    var sources = await articlesApi.getBySourceIdAndQuery("abc-news", "Trump");
    expect(sources.length, isNot(0));
    print(sources[0]);
  });

  test('Testing Articles API search query exception', () async {
    var exceptionThrown = false;
    try {
      var sources = await articlesApi.getBySourceIdAndQuery("abc-news", null);
    } on SearchQueryIsNullException {
      exceptionThrown = true;
    }

    expect(exceptionThrown, true);
  });

  test('Testing Articles API news source exception', () async {
    var exceptionThrown = false;
    try {
      var sources = await articlesApi.getBySourceIdAndQuery(null, "Trump");
    } on NewsSourceIsNullException {
      exceptionThrown = true;
    }

    expect(exceptionThrown, true);
  });
}
