import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/config/config.dart';
import 'package:news_reader/screens/articles/articles_page.dart';
import 'package:news_reader/screens/articles_webview/news_article_webview.dart';
import 'package:news_reader/service/articles_api_service.dart';
import 'package:news_reader/service/sources_api_service.dart';

import 'bloc/articles/articles_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'screens/home/home_page.dart';

const MaterialColor whiteSwatch = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: Colors.white,
    100: Colors.white,
    200: Colors.white,
    300: Colors.white,
    400: Colors.white,
    500: Colors.white,
    600: Colors.white,
    700: Colors.white,
    800: Colors.white,
    900: Colors.white,
  },
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.instance.appName,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => _buildHome(),
      },
      theme:
          ThemeData(primarySwatch: whiteSwatch, textTheme: _buildTextTheme()),
      onGenerateRoute: (settings) {
        if (settings.name == ArticlesPage.route) {
          final ArticlesPageArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => ArticlesBloc(ArticlesApiService()),
              child: ArticlesPage(
                newsSourceId: args.newsSourceId,
              ),
            ),
          );
        }

        if (settings.name == NewsArticleWebView.route) {
          final NewsArticleWebViewArguments args = settings.arguments;

          return MaterialPageRoute(
              builder: (_) => NewsArticleWebView(
                    articleUrl: args.articleUrl,
                  ));
        }
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

  TextTheme _buildTextTheme() {
    var baseTheme = GoogleFonts.latoTextTheme();
    return baseTheme.copyWith(
      title: baseTheme.title
          .copyWith(fontFamily: GoogleFonts.merriweather().fontFamily),
      subtitle: baseTheme.subtitle
          .copyWith(fontFamily: GoogleFonts.merriweather().fontFamily),
    );
    // final TextTheme defaultTheme = Typography(platform: defaultTargetPlatform).black;
    // return defaultTheme.copyWith(

    //   title: defaultTheme.title.copyWith(fontFamily: GoogleFonts.merriweather().fontFamily),

    // );
  }
}
