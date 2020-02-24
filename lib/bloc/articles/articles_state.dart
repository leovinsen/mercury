import 'package:equatable/equatable.dart';
import 'package:news_reader/model/news_article.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();
}

class InitialArticlesState extends ArticlesState {
  const InitialArticlesState();

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return '$InitialArticlesState { }';
  }
}

class ArticlesLoaded extends ArticlesState {
  final List<NewsArticle> articles;

  ArticlesLoaded(this.articles);

  @override
  List<Object> get props => [articles];

  @override
  String toString() {
    return "$ArticlesLoaded { articles: $articles }";
  }
}

class LoadingNewArticles extends ArticlesState {
  LoadingNewArticles();

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return "$LoadingNewArticles { }";
  }
}
