import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class LoadArticlesBySource extends ArticlesEvent {
  final String newsSourceId;

  LoadArticlesBySource(this.newsSourceId);

  @override
  List<Object> get props => [newsSourceId];

  @override
  String toString() {
    return '$LoadArticlesBySource { newsId: $newsSourceId }';
  }
}
