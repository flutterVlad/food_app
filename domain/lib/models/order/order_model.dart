import 'package:domain/domain.dart';
import 'package:domain/models/cart/cart_model.dart';

class OrderModel {
  final String id;
  final CartModel cart;
  final DateTime dateTime;
  final bool approved;
  final UserModel user;

  OrderModel({
    required this.id,
    required this.cart,
    required this.dateTime,
    required this.approved,
    required this.user,
  });

  OrderModel.empty()
      : id = '',
        cart = CartModel.empty,
        dateTime = DateTime.now(),
        approved = false,
        user = UserModel.empty;

  OrderModel copyWith({
    String? id,
    CartModel? cart,
    DateTime? dateTime,
    bool? approved,
    UserModel? user,
  }) {
    return OrderModel(
      id: id ?? this.id,
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
      approved: approved ?? this.approved,
      user: user ?? this.user,
    );
  }
}
