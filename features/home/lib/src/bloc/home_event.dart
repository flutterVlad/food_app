part of 'home_bloc.dart';

abstract class ProductEvent {}

class InitEvent extends ProductEvent {}

class NavigateToDetailPageEvent extends ProductEvent {
  final ProductModel model;

  NavigateToDetailPageEvent({
    required this.model,
  });
}

class CheckInternetEvent extends ProductEvent {}

class FilterByCategoryEvent extends ProductEvent {
  final String category;

  FilterByCategoryEvent({
    required this.category,
  });
}

class ShowAllProductsEvent extends ProductEvent {}
