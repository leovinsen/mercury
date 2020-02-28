import 'package:equatable/equatable.dart';

abstract class FavoriteArticlesEvent extends Equatable {
  const FavoriteArticlesEvent();
}

class LoadFavoriteArticles extends FavoriteArticlesEvent {
  const LoadFavoriteArticles();

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return '$LoadFavoriteArticles { } ';
  }
}
