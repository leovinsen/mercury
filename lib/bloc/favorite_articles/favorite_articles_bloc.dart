import 'package:mercury/base/base_bloc.dart';
import 'package:mercury/bloc/favorite_articles/favorite_articles_event.dart';
import 'package:mercury/bloc/favorite_articles/favorite_articles_state.dart';
import 'package:mercury/database/article_dao.dart';

class FavoriteArticlesBloc extends BaseBloc<FavoriteArticlesEvent, FavoriteArticlesState> {

  final ArticleDao _articleDao;

  FavoriteArticlesBloc(this._articleDao);

  @override
  FavoriteArticlesState get initialState => InitialFavoriteArticlesState();

  @override
  Stream<FavoriteArticlesState> mapEventToState(FavoriteArticlesEvent event) async* {
    if(event is LoadFavoriteArticles) {
      var articles = await _articleDao.findAll();
      yield FavoriteArticlesLoaded(articles);
    }
  }

}