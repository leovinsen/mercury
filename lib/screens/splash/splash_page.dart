import 'package:flutter/material.dart';
import 'package:news_reader/database/article_dao.dart';
import 'package:news_reader/database/database.dart';
import 'package:news_reader/global.dart';
import 'package:news_reader/screens/root/root_page.dart';
import 'package:news_reader/screens/root/widgets/app_title.dart';

class SplashPage extends StatefulWidget {
  static const route = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.instance.db.then((db) async {
      var articleDao = ArticleDao(db);
      sl.registerSingleton<ArticleDao>(articleDao, signalsReady: true);
      await Future.delayed(Duration(milliseconds: 2500));
      Navigator.of(context).pushNamed(RootPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTitle(),
      ),
    );
  }
}
