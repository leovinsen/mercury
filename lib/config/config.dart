import 'package:flutter/material.dart';
import 'package:news_reader/app.dart';

enum EnvType { development, production }

abstract class Config {
  static Config instance;

  final EnvType env;
  
  final String appName = 'News app';
  final String apiBaseUrl = 'http://newsapi.org/v2/';
  final String apiKey = 'deea836cb7a942699f2e9024b039c2e6';

  Config(this.env) {
    instance = this;
    WidgetsFlutterBinding.ensureInitialized();
    runApp(App());
  }
}
