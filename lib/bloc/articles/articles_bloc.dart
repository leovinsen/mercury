import 'package:news_reader/base/base_bloc.dart';
import 'package:news_reader/bloc/articles/articles_event.dart';
import 'package:news_reader/bloc/articles/articles_state.dart';
import 'package:news_reader/model/news_article.dart';
import 'package:news_reader/service/articles_api_service.dart';

class ArticlesBloc extends BaseBloc<ArticlesEvent, ArticlesState> {
  final ArticlesApiService articlesApiService;

  ArticlesBloc(this.articlesApiService);

  @override
  ArticlesState get initialState => InitialArticlesState();

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is LoadArticlesBySource) {
      var articles =
          await articlesApiService.getBySourceId(event.newsSourceId);
      yield ArticlesLoaded(articles);
    }
  }
}