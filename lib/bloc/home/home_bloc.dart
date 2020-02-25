import 'package:news_reader/base/base_bloc.dart';
import 'package:news_reader/model/news_source.dart';
import 'package:news_reader/service/sources_api_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final SourcesApiService sourcesApiService;

  HomeBloc(this.sourcesApiService);

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadNewsSources) {
      var newsSources = await sourcesApiService.getAll();
      yield NewsSourcesLoaded(filterSourcesByCategory(newsSources));
    }
  }

  Map<String, List<NewsSource>> filterSourcesByCategory(List<NewsSource> sources) {
    Map<String, List<NewsSource>> map = {
      'English': [],
      'Mandarin': [],
      'Others': [],
    };

    sources.forEach((source) {
      switch (source.language) {
        case 'en':
          map['English'].add(source);
          break;
        case 'zh':
          map['Mandarin'].add(source);
          break;
        default:
          map['Others'].add(source);
          break;
      }
    });

    return map;
  }
}
