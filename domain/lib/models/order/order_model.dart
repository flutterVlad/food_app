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
}