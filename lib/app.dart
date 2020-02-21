import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/config/config.dart';
import 'package:news_reader/service/sources_api_service.dart';

import 'bloc/home/home_bloc.dart';
import 'screens/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.instance.appName,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => _buildHome(),
      },
    );
  }

  Widget _buildHome() {
    return BlocProvider<HomeBloc>(
      create: (_) {
        return HomeBloc(SourcesApiService());
      },
      child: HomePage(),
    );
  }
}
