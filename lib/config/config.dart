import 'package:flutter/material.dart';
import 'package:mercury/app.dart';

enum EnvType { development, production }

abstract class Config {
  static Config instance;

  final EnvType env;
  
  final String appName = 'News app';
  final String apiBaseUrl = 'http://newsapi.org/v2/';
  String apiKey;

  Config(this.env) {
    instance = this;
    WidgetsFlutterBinding.ensureInitialized();
    runApp(App());
  }
}
