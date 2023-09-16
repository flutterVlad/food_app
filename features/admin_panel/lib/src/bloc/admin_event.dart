part of 'admin_bloc.dart';

abstract class AdminEvent {}

class InitProductsEvent extends AdminEvent {}

class InitOrdersEvent extends AdminEvent {}

class InitUsersEvent extends AdminEvent {}

class SelectOrderEvent extends AdminEvent {
  final OrderModel order;

  SelectOrderEvent({
    required this.order,
  });
}

class OpenApprovedOrderTileEvent extends AdminEvent {
  final int index;

  OpenApprovedOrderTileEvent({
    required this.index,
  });
}

class OpenUnapprovedOrderTileEvent extends AdminEvent {
  final int index;

  OpenUnapprovedOrderTileEvent({
    required this.index,
  });
}

class UncheckOrderEvent extends AdminEvent {
  final OrderModel order;

  UncheckOrderEvent({
    required this.order,
  });
}

class ApproveOrdersEvent extends AdminEvent {
  final List<OrderModel> orders;

  ApproveOrdersEvent({
    required this.orders,
  });
}

class AddProductEvent extends AdminEvent {}

class UpdateProductEvent extends AdminEvent {
  final ProductModel product;

  UpdateProductEvent({
    required this.product,
  });
}

class DeleteProductEvent extends AdminEvent {
  final ProductModel product;

  DeleteProductEvent({
    required this.product,
  });
}

class NavigateToEditEvent extends AdminEvent {
  final ProductModel product;

  NavigateToEditEvent({
    required this.product,
  });
}

class AddIngredientEvent extends AdminEvent {
  final String ingredient;

  AddIngredientEvent({
    required this.ingredient,
  });
}

class RemoveIngredientEvent extends AdminEvent {
  final int index;

  RemoveIngredientEvent({
    required this.index,
  });
}

class NavigateToCreateProduct extends AdminEvent {}

class SelectImageEvent extends AdminEvent {}

class NavigateBackEvent extends AdminEvent {}

class ThrowExceptionEvent extends AdminEvent {
  final String exception;

  ThrowExceptionEvent({
    required this.exception,
  });
}
