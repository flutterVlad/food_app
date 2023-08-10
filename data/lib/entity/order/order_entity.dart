import 'package:data/entity/cart/cart_entity.dart';

class OrderEntity {
  final String id;
  final CartEntity cart;
  final DateTime dateTime;

  OrderEntity({
    required this.id,
    required this.cart,
    required this.dateTime,
  });

  factory OrderEntity.fromJson(Map<dynamic, dynamic> json) => OrderEntity(
        id: json['id'],
        cart: CartEntity.fromJson(json['cart']),
        dateTime: DateTime.parse(json['datetime'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cart': cart.toMap(),
        'datetime': dateTime.toString(),
      };

  OrderEntity copyWith({
    String? id,
    CartEntity? cart,
    DateTime? dateTime,
  }) =>
      OrderEntity(
        id: id ?? this.id,
        cart: cart ?? this.cart,
        dateTime: dateTime ?? this.dateTime,
      );
}
