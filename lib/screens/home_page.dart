import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/home/home_bloc_commons.dart';
import 'package:news_reader/screens/widgets/news_sources_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          if (state is HomeInitialState) {
            BlocProvider.of<HomeBloc>(context).add(LoadNewsSources());
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsSourcesLoaded) {
            return NewsSourcesListView(newsSources: state.newsSources);
          }

          return Container();
        },
      ),
    );
  }
}
