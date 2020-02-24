import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/home/home_bloc_commons.dart';
import 'package:news_reader/screens/home/widgets/app_title.dart';
import 'package:news_reader/widgets/my_circular_progress_indicator.dart';

import 'widgets/news_sources_listview.dart';

class HomePage extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              AppTitle(),
              Flexible(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (_, state) {
                    if (state is HomeInitialState) {
                      BlocProvider.of<HomeBloc>(context).add(LoadNewsSources());
                      return Center(
                        child: MyCircularProgressIndicator()
                      );
                    }
                    if (state is NewsSourcesLoaded) {
                      return NewsSourcesListView(
                          newsSources: state.newsSources);
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
