import 'package:flutter/material.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/database/database.dart';
import 'package:mercury/global.dart';
import 'package:mercury/screens/root/root_page.dart';
import 'package:mercury/screens/root/widgets/app_title.dart';

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
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.of(context).pushReplacementNamed(RootPage.route);
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
