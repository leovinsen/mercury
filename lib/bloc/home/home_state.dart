import 'package:equatable/equatable.dart';
import 'package:news_reader/model/news_source.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return '$HomeInitialState {  }';
  }

}

class NewsSourcesLoaded extends HomeState {

  final Map<String, List<NewsSource>> newsSourcesMap;

  NewsSourcesLoaded(this.newsSourcesMap);

  @override
  List<Object> get props => [newsSourcesMap];

  @override
  String toString() {
    return '$NewsSourcesLoaded { sources: $newsSourcesMap }';
  }

}