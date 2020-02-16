import 'package:dio/dio.dart';
import 'package:news_reader/base/base_api_service.dart';
import 'package:news_reader/model/news_source.dart';
import 'package:news_reader/model/sources_response.dart';

class SourcesApiService extends BaseApiService {
  SourcesApiService() : super("sources");

  Future<List<NewsSource>> getAll() async {
    Response response = await dio.get(endpoint + "?apiKey=$apiKey").catchError(print);
  
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    
    return sourcesResponse.sources;
  }
}
