import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> getApiKey() async {
  var path = 'assets/api_key.json';

  Map<String, dynamic> jsonMap =
      await rootBundle.loadString(path).then((jsonStr) => jsonDecode(jsonStr));
  return jsonMap['key'];
}
