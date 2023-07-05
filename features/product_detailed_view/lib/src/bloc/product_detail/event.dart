part of 'bloc.dart';

abstract class ProductDetailEvent {}

class LoadEvent extends ProductDetailEvent {
  final int id;

  LoadEvent({required this.id});
}
