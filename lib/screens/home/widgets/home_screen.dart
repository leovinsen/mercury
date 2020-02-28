import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/home/home_bloc_commons.dart';
import 'package:news_reader/screens/home/widgets/news_sources_by_category.dart';
import 'package:news_reader/widgets/my_circular_progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                if (state is HomeInitialState) {
                  BlocProvider.of<HomeBloc>(context).add(LoadNewsSources());
                  return Center(child: MyCircularProgressIndicator());
                }
                if (state is NewsSourcesLoaded) {
                  return NewsSourcesByCategory(
                      newsSourcesMap: state.newsSourcesMap);
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
