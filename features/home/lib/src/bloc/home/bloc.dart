import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<HomeState> init() async {
    return state.clone();
  }
}
