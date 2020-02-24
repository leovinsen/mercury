import 'package:dio/dio.dart';
import 'package:news_reader/base/base_api_service.dart';
import 'package:news_reader/exception/articles_api_exception.dart';
import 'package:news_reader/model/articles_response.dart';
import 'package:news_reader/model/news_article.dart';

class ArticlesApiService extends BaseApiService {
  ArticlesApiService() : super("everything");

  Future<List<NewsArticle>> getBySourceIdAndQuery(
      String sourceId, String query) async {

    if (sourceId == null) throw NewsSourceIsNullException();
    if (query == null) throw SearchQueryIsNullException();

    Response response = await dio
        .get("$endpoint?sources=$sourceId&qInTitle=$query&apiKey=$apiKey")
        .catchError(print);

    ArticlesResponse articlesResponse =
        ArticlesResponse.fromJson(response.data);

    return articlesResponse.articles;
  }
}
