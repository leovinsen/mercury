import 'package:news_reader/base/base_bloc.dart';
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
      yield NewsSourcesLoaded(newsSources);
    }
  }
}
