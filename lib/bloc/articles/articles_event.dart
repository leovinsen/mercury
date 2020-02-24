import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class LoadArticlesBySource extends ArticlesEvent {
  final String newsSourceId;
  final String query;

  LoadArticlesBySource(this.newsSourceId, this.query);

  @override
  List<Object> get props => [newsSourceId];

  @override
  String toString() {
    return '$LoadArticlesBySource { newsId: $newsSourceId, query: $query }';
  }
}
