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

  final List<NewsSource> newsSources;

  NewsSourcesLoaded(this.newsSources);

  @override
  List<Object> get props => [newsSources];

  @override
  String toString() {
    return '$NewsSourcesLoaded { sources: $newsSources }';
  }

}