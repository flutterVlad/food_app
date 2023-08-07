import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class AddOrderUseCase implements FutureUseCase<Map<String, dynamic>, void> {
  final OrderRepository _orderRepository;

  AddOrderUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<void> execute(Map<String, dynamic> data) async {
    await _orderRepository.addOrder(
      order: data['order'],
      uid: data['uid'],
    );
  }
}
