import 'package:domain/domain.dart';
import 'package:domain/models/order/order_model.dart';
import 'package:domain/usecases/usecase.dart';

class GetOrdersUseCase implements FutureUseCase<String, List<OrderModel>> {
  final OrderRepository _orderRepository;

  GetOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<OrderModel>> execute(String uid) async {
    return _orderRepository.getOrders(uid);
  }
}
