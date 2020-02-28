import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/bloc/favorite_articles/favorite_articles_bloc_commons.dart';
import 'package:mercury/screens/root/widgets/favorite_articles_listview.dart';
import 'package:mercury/widgets/my_circular_progress_indicator.dart';

class FavoriteArticlesScreen extends StatelessWidget {
  static const appbarTitle = "Your Favorites";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteArticlesBloc, FavoriteArticlesState>(
      bloc: BlocProvider.of<FavoriteArticlesBloc>(context),
      builder: (_, state) {
        if (state is InitialFavoriteArticlesState) {
          BlocProvider.of<FavoriteArticlesBloc>(context)
              .add(LoadFavoriteArticles());
          return Center(
            child: MyCircularProgressIndicator(),
          );
        }

        if (state is FavoriteArticlesLoaded) {
          final articles = state.articles;
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: articles.length > 0
                ? FavoriteArticlesListView(
                    articles: state.articles,
                  )
                : Text(
                    'Find an article you like and tap the love button!',
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
          );
        }

        return Container();
      },
    );
  }
}
