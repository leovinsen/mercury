import 'package:bloc/bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  
  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);
    print(transition);
  }

}