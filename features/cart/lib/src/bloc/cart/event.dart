part of 'bloc.dart';

abstract class CartEvent {
  late final ProductModel model;
}

class AddProductEvent extends CartEvent {
  @override
  final ProductModel model;

  AddProductEvent({required this.model});
}

class RemoveProductEvent extends CartEvent {
  @override
  final ProductModel model;

  RemoveProductEvent({required this.model});
}
