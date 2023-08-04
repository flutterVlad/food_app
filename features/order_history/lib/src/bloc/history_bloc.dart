import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    on<InitEvent>(_initHistory);

    add(InitEvent());
  }

  Future<void> _initHistory(
    InitEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state);
  }
}
