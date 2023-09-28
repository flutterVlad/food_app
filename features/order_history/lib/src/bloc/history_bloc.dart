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
    on<OpenTileEvent>(_openTile);
  }

  Future<void> _initHistory(
    InitHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    final List<OrderModel> orders = await _getOrderUseCase.execute(event.user.uid);
    emit(
      state.copyWith(
        orders: orders,
        user: event.user,
        isTileOpenList: List.filled(orders.length, false),
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
            isApproved: false,
            user: state.user),
        'uid': state.user.uid,
      },
    );
    final List<OrderModel> orders = await _getOrderUseCase.execute(
      state.user.uid,
    );
    emit(
      state.copyWith(
        orders: orders,
        isTileOpenList: List.filled(orders.length, false),
      ),
    );
  }

  Future<void> _openTile(
    OpenTileEvent event,
    Emitter<HistoryState> emit,
  ) async {
    final List<bool> updatedList = state.isTileOpenList;
    updatedList[event.index] = !updatedList[event.index];
    emit(
      state.copyWith(
        isTileOpenList: updatedList,
      ),
    );
  }
}
