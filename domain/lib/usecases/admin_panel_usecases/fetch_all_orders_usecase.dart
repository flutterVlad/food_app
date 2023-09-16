import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllOrdersUseCase extends FutureUseCase<NoParams, List<OrderModel>> {
  final OrderRepository _orderRepository;

  FetchAllOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<OrderModel>> execute(NoParams input) async {
    return _orderRepository.fetchAllOrders();
  }
}
