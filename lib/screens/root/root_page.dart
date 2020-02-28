import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/bloc/favorite_articles/favorite_articles_bloc.dart';
import 'package:mercury/bloc/home/home_bloc_commons.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/global.dart';
import 'package:mercury/screens/root/widgets/settings_screen.dart';
import 'package:mercury/service/sources_api_service.dart';
import 'package:mercury/widgets/drawer_tile.dart';
import 'package:mercury/widgets/mercury_drawer_header.dart';

import 'widgets/favorite_articles_screen.dart';
import 'widgets/home_screen.dart';

class RootPage extends StatefulWidget {
  static const route = "/";

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _chosenPage;

  @override
  void initState() {
    super.initState();
    _chosenPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            MercuryDrawerHeader(),
            DrawerTile(
                chosenIndex: _chosenPage,
                tileIndex: 0,
                tileName: 'Home',
                onTap: () => _selectWidget(0),
                iconData: Icons.home),
            DrawerTile(
                chosenIndex: _chosenPage,
                tileIndex: 1,
                tileName: 'Favorited Articles',
                onTap: () => _selectWidget(1),
                iconData: Icons.favorite),
            DrawerTile(
                chosenIndex: _chosenPage,
                tileIndex: 2,
                tileName: 'Settings',
                onTap: () => _selectWidget(2),
                iconData: Icons.settings),
          ],
        ),
      ),
      body: _buildWidget(),
    );
  }

  Widget _buildAppBarTitle() {
    String txt;
    switch (_chosenPage) {
      case 0:
        txt = HomeScreen.appBarTitle;
        break;
      case 1:
        txt = FavoriteArticlesScreen.appbarTitle;
        break;
      case 2:
        txt = SettingsScreen.appBarTitle;
        break;
      default:
        txt = null;
        break;
    }
    return Text(txt);
  }

  Widget _buildWidget() {
    switch (_chosenPage) {
      case 0:
        return BlocProvider<HomeBloc>(
          create: (_) {
            return HomeBloc(SourcesApiService());
          },
          child: HomeScreen(),
        );
      case 1:
        return BlocProvider<FavoriteArticlesBloc>(
          create: (_) => FavoriteArticlesBloc(sl.get<ArticleDao>()),
          child: FavoriteArticlesScreen(),
        );
      case 2:
        return SettingsScreen();
      default:
        return null;
    }
  }

  void _selectWidget(int i) {
    _chosenPage = i;
    setState(() {});
    Navigator.of(context).pop();
  }
}
