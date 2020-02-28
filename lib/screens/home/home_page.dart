import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/favorite_articles/favorite_articles_bloc.dart';
import 'package:news_reader/bloc/home/home_bloc_commons.dart';
import 'package:news_reader/database/article_dao.dart';
import 'package:news_reader/database/database.dart';
import 'package:news_reader/screens/home/widgets/news_sources_by_category.dart';
import 'package:news_reader/widgets/my_circular_progress_indicator.dart';

import 'widgets/favorite_articles_screen.dart';

class HomePage extends StatefulWidget {
  static const route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _chosenPage = 0;
  ArticleDao _articleDao;

  @override
  void initState() {
    super.initState();
    //TODO: Get instance with GetIt
    DatabaseProvider.instance.db.then((db) => _articleDao = ArticleDao(db));
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
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => _selectWidget(0),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorited Articles'),
                onTap: () => _selectWidget(1),
              )
            ],
          ),
        ),
        body: _buildWidget());
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
      default:
        txt = null;
        break;
    }
    return Text(txt);
  }

  Widget _buildWidget() {
    switch (_chosenPage) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return BlocProvider<FavoriteArticlesBloc>(
          create: (_) => FavoriteArticlesBloc(_articleDao),
          child: FavoriteArticlesScreen(),
        );
        break;
      default:
        return null;
        break;
    }
  }

  void _selectWidget(int i) {
    _chosenPage = i;
    setState(() {});
    Navigator.of(context).pop();
  }
}

class HomeScreen extends StatelessWidget {
  static const appBarTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                if (state is HomeInitialState) {
                  BlocProvider.of<HomeBloc>(context).add(LoadNewsSources());
                  return Center(child: MyCircularProgressIndicator());
                }
                if (state is NewsSourcesLoaded) {
                  return NewsSourcesByCategory(
                      newsSourcesMap: state.newsSourcesMap);
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
