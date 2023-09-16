import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class ApproveOrdersUseCase extends FutureUseCase<List<OrderModel>, void> {
  final OrderRepository _orderRepository;

  ApproveOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<void> execute(List<OrderModel> input) async {
    await _orderRepository.approveOrders(orders: input);
  }
}
