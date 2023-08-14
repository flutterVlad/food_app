import 'package:domain/models/order/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getOrders(String uid);

  Future<void> addOrder({
    required OrderModel order,
    required String uid,
  });
}
