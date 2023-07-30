part of 'home_bloc.dart';

abstract class ProductEvent {}

class InitEvent extends ProductEvent {}

class NavigateToDetailPageEvent extends ProductEvent {
  final BuildContext context;
  final ProductModel model;

  NavigateToDetailPageEvent({
    required this.context,
    required this.model,
  });
}

class CheckInternetEvent extends ProductEvent {}
