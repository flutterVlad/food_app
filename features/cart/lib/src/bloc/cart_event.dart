part of 'cart_bloc.dart';

abstract class CartEvent {}

class InitEvent extends CartEvent {}

class AddProductEvent extends CartEvent {
  final ProductModel productModel;

  AddProductEvent({required this.productModel});
}

class RemoveProductEvent extends CartEvent {
  final CartProductModel productModel;

  RemoveProductEvent({required this.productModel});
}

class RouteToDetailPageEvent extends CartEvent {
  final ProductModel model;

  RouteToDetailPageEvent({
    required this.model,
  });
}

class CreateOrderEvent extends CartEvent {
  final String uid;

  CreateOrderEvent({required this.uid});
}
