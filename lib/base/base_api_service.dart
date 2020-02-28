import 'package:dio/dio.dart';
import 'package:mercury/config/config.dart';

abstract class BaseApiService {
  final Dio dio = Dio();
  final String endpoint;

  String get apiKey => Config.instance.apiKey;

  BaseApiService(String endpointSegment)
      : endpoint = Config.instance.apiBaseUrl + endpointSegment;
}
