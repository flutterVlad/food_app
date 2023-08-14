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
  final int index;

  FilterByCategoryEvent({
    required this.category,
    required this.index,
  });
}

class ShowAllProductsEvent extends ProductEvent {}
