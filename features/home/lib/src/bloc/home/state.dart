part of 'bloc.dart';

abstract class ProductState extends Equatable {

  @override
  List<Object> get props => [];

  List<ProductModel> get getProducts => [];
}

class LoadingState extends ProductState {}

class EmptyState extends ProductState {}

class LoadedState extends ProductState {
  final List<ProductModel> products;

  LoadedState({required this.products});

  @override
  List<Object> get props => [products];


  @override
  List<ProductModel> get getProducts => products;
}
