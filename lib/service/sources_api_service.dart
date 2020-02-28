import 'package:dio/dio.dart';
import 'package:mercury/base/base_api_service.dart';
import 'package:mercury/model/news_source.dart';
import 'package:mercury/model/sources_response.dart';

class SourcesApiService extends BaseApiService {
  SourcesApiService() : super("sources");

  Future<List<NewsSource>> getAll() async {
    Response response = await dio.get(endpoint + "?apiKey=$apiKey").catchError(print);
  
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    
    return sourcesResponse.sources;
  }
}
