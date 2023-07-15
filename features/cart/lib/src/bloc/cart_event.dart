part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddProductEvent extends CartEvent {
  final ProductModel model;

  AddProductEvent({required this.model});
}

class RemoveProductEvent extends CartEvent {
  final ProductModel model;

  RemoveProductEvent({required this.model});
}

class RouteToDetailPageEvent extends CartEvent {
  final BuildContext context;
  final ProductModel model;

  RouteToDetailPageEvent({
    required this.context,
    required this.model,
  });
}
