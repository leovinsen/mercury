import 'package:equatable/equatable.dart';
import 'package:news_reader/model/news_article.dart';

abstract class FavoriteArticlesState extends Equatable {
  const FavoriteArticlesState();
}


class InitialFavoriteArticlesState extends FavoriteArticlesState {
  @override
  List<Object> get props => null;

  @override
  String toString() {
    return '$InitialFavoriteArticlesState { }';
  }

}

class FavoriteArticlesLoaded extends FavoriteArticlesState {
  final List<NewsArticle> articles;

  FavoriteArticlesLoaded(this.articles);

  @override
  List<Object> get props => [articles];

  @override
  String toString() {
    return '$FavoriteArticlesLoaded { articles: $articles }';
  }
}