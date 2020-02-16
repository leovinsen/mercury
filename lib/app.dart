import 'package:flutter/material.dart';
import 'package:news_reader/config/config.dart';

import 'screens/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.instance.appName,
      home: HomePage(),
    );
  }
}