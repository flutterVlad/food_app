part of 'bloc.dart';

abstract class ProductDetailState {}

class EmptyState extends ProductDetailState {}

class LoadingState extends ProductDetailState {}

class LoadedState extends ProductDetailState {
  final ProductModel model;

  LoadedState({required this.model});
}
