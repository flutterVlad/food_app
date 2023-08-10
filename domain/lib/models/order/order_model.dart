import 'package:domain/domain.dart';
import 'package:domain/models/cart/cart_model.dart';

class OrderModel {
  final String id;
  final CartModel cart;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.cart,
    required this.dateTime,
  });

  OrderModel.empty()
      : id = '',
        cart = CartModel.empty,
        dateTime = DateTime.now();

  OrderModel copyWith({
    String? id,
    CartModel? cart,
    DateTime? dateTime,
  }) =>
      OrderModel(
        id: id ?? this.id,
        cart: cart ?? this.cart,
        dateTime: dateTime ?? this.dateTime,
      );
}
