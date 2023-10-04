import 'package:data/entity/cart/cart_entity.dart';
import 'package:data/entity/user/user_entity.dart';

class OrderEntity {
  final String id;
  final CartEntity cart;
  final DateTime dateTime;
  final bool isApproved;
  final UserEntity user;

  const OrderEntity({
    required this.id,
    required this.cart,
    required this.dateTime,
    required this.isApproved,
    required this.user,
  });

  factory OrderEntity.fromJson(Map<dynamic, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      cart: CartEntity.fromJson(json['cart']),
      dateTime: DateTime.parse(json['datetime'] as String),
      isApproved: json['approved'],
      user: UserEntity.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cart': cart.toMap(),
      'datetime': dateTime.toString(),
      'approved': isApproved,
    };
  }

  OrderEntity copyWith({
    String? id,
    CartEntity? cart,
    DateTime? dateTime,
    bool? isApproved,
    UserEntity? user,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
      isApproved: isApproved ?? this.isApproved,
      user: user ?? this.user,
    );
  }
}
