import 'package:data/entity/order/order_entity.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';
import 'package:data/providers/firebase_provider.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseProvider _firebaseProvider;

  OrderRepositoryImpl({
    required FirebaseProvider firebaseProvider,
  }) : _firebaseProvider = firebaseProvider;

  @override
  Future<List<OrderModel>> getOrders(String uid) async {
    final List<OrderEntity> orders = await _firebaseProvider.getOrderData(uid);

    return orders
        .map((OrderEntity order) => OrderMapper.toModel(order))
        .toList();
  }

  @override
  Future<void> addOrder({
    required OrderModel order,
    required String uid,
  }) async {
    final OrderEntity orderEntity = OrderMapper.toEntity(order);

    await _firebaseProvider.addOrderOnDatabase(
      order: orderEntity,
      uid: uid,
    );
  }

  @override
  Future<List<OrderModel>> fetchAllOrders() async {
    final List<OrderEntity> orderEntities =
        await _firebaseProvider.fetchAllOrders();

    return orderEntities
        .map((OrderEntity orderEntity) => OrderMapper.toModel(orderEntity))
        .toList();
  }

  @override
  Future<void> approveOrders({
    required List<OrderModel> orders,
  }) async {
    final List<OrderEntity> orderEntities = orders
        .map(
          (OrderModel order) => OrderMapper.toEntity(order),
        )
        .toList();

    await _firebaseProvider.approveOrders(orders: orderEntities);
  }
}
