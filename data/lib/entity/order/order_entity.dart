import 'package:data/entity/cart/cart_entity.dart';

class OrderEntity {
  final String id;
  final CartEntity cart;
  final DateTime dateTime;

  const OrderEntity({
    required this.id,
    required this.cart,
    required this.dateTime,
  });

  factory OrderEntity.fromJson(Map<dynamic, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      cart: CartEntity.fromJson(json['cart']),
      dateTime: DateTime.parse(json['datetime'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cart': cart.toMap(),
      'datetime': dateTime.toString(),
    };
  }

  OrderEntity copyWith({
    String? id,
    CartEntity? cart,
    DateTime? dateTime,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
