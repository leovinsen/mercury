import 'package:mercury/base/base_bloc.dart';
import 'package:mercury/bloc/articles/articles_event.dart';
import 'package:mercury/bloc/articles/articles_state.dart';
import 'package:mercury/service/articles_api_service.dart';

class ArticlesBloc extends BaseBloc<ArticlesEvent, ArticlesState> {
  final ArticlesApiService articlesApiService;

  ArticlesBloc(this.articlesApiService);

  @override
  ArticlesState get initialState => InitialArticlesState();

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is LoadArticlesBySource) {
      yield LoadingNewArticles();
      var articles =
          await articlesApiService.getBySourceIdAndQuery(event.newsSourceId, event.query);
      yield ArticlesLoaded(articles);
    }
  }
}
