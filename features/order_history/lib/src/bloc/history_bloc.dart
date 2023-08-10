import 'package:domain/domain.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AddOrderUseCase _addOrderUseCase;
  final GetOrdersUseCase _getOrderUseCase;

  HistoryBloc({
    required AddOrderUseCase addOrderUseCase,
    required GetOrdersUseCase getOrdersUseCase,
  })  : _getOrderUseCase = getOrdersUseCase,
        _addOrderUseCase = addOrderUseCase,
        super(HistoryState.empty()) {
    on<InitHistoryEvent>(_initHistory);
    on<AddOrderEvent>(_addOrder);
  }

  Future<void> _initHistory(
    InitHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    final List<OrderModel> orders = await _getOrderUseCase.execute(event.uid);
    emit(
      state.copyWith(
        orders: orders,
        uid: event.uid,
      ),
    );
  }

  Future<void> _addOrder(
    AddOrderEvent event,
    Emitter<HistoryState> emit,
  ) async {
    await _addOrderUseCase.execute(
      {
        'order': OrderModel(
          id: '',
          cart: event.cartModel,
          dateTime: DateTime.now(),
        ),
        'uid': state.uid,
      },
    );
    final List<OrderModel> orders = await _getOrderUseCase.execute(state.uid);
    emit(
      state.copyWith(
        orders: orders,
      ),
    );
  }
}
