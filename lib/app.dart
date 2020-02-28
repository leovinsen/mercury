import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury/config/config.dart';
import 'package:mercury/screens/articles/articles_page.dart';
import 'package:mercury/screens/articles_webview/news_article_webview.dart';
import 'package:mercury/screens/root/root_page.dart';
import 'package:mercury/screens/splash/splash_page.dart';
import 'package:mercury/service/articles_api_service.dart';

import 'bloc/articles/articles_bloc.dart';

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
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (_) => SplashPage(),
        RootPage.route: (_) => RootPage(),
      },
      theme:
          ThemeData(primarySwatch: whiteSwatch, textTheme: _buildTextTheme()),
      onGenerateRoute: (settings) {
        if (settings.name == ArticlesPage.route) {
          final ArticlesPageArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (_) => BlocProvider<ArticlesBloc>(
              create: (_) => ArticlesBloc(ArticlesApiService()),
              child: ArticlesPage(
                newsSourceId: args.newsSourceId,
                newsSourceName: args.newsSourceName,
              ),
            ),
          );
        }

        if (settings.name == NewsArticleWebView.route) {
          final NewsArticleWebViewArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (_) => NewsArticleWebView(article: args.article),
          );
        }
      },
    );
  }

  TextTheme _buildTextTheme() {
    var baseTheme = GoogleFonts.latoTextTheme();
    var merriweatherTheme = GoogleFonts.merriweather();
    return baseTheme.copyWith(
      title: baseTheme.title.copyWith(
        fontFamily: merriweatherTheme.fontFamily,
      ),
      subtitle: baseTheme.subtitle.copyWith(
        fontFamily: merriweatherTheme.fontFamily,
      ),
      display1: baseTheme.display1.copyWith(
        fontFamily: merriweatherTheme.fontFamily,
      ),
      display2: baseTheme.display2.copyWith(
        fontFamily: merriweatherTheme.fontFamily,
      ),
      headline: baseTheme.headline.copyWith(
        fontFamily: merriweatherTheme.fontFamily,
        fontWeight: FontWeight.w600,
      ),
    );
    // final TextTheme defaultTheme = Typography(platform: defaultTargetPlatform).black;
    // return defaultTheme.copyWith(

    //   title: defaultTheme.title.copyWith(fontFamily: GoogleFonts.merriweather().fontFamily),

    // );
  }
}
