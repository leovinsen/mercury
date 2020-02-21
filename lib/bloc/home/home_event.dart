import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadNewsSources extends HomeEvent {
  @override
  List<Object> get props => null;

  @override
  String toString() {
    return '$LoadNewsSources {  }';
  }
}
