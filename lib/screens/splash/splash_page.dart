import 'package:flutter/material.dart';
import 'package:mercury/config/config.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/database/database.dart';
import 'package:mercury/global.dart';
import 'package:mercury/screens/root/root_page.dart';
import 'package:mercury/screens/root/widgets/app_title.dart';
import 'package:mercury/secret/secret_loader.dart';

class SplashPage extends StatefulWidget {
  static const route = "/";

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

      Config.instance.apiKey = await getApiKey();
      
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
