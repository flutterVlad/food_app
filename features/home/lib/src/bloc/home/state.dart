part of 'bloc.dart';

abstract class ProductState extends Equatable {

  @override
  List<Object> get props => [];

  List<ProductModel> get getProducts => [];

  int get getIndex => 0;
}

class LoadingState extends ProductState {}

class EmptyState extends ProductState {}

class LoadedState extends ProductState {
  final List<ProductModel> products;
  final int currentIndex;

  LoadedState({required this.products, required this.currentIndex});

  @override
  List<Object> get props => [products, currentIndex];

  @override
  int get getIndex => currentIndex;

  @override
  List<ProductModel> get getProducts => products;
}
