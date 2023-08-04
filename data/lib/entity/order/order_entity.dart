import 'package:data/entity/cart/cart_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        dateTime: (json['datetime'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cart': cart.toMap(),
        'datetime': dateTime,
      };
}
