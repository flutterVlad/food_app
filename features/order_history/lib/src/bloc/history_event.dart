part of 'history_bloc.dart';

class HistoryEvent {}

class InitEvent extends HistoryEvent {}

class AddOrderEvent extends HistoryEvent {
  final List<ProductModel> products;
  final int count;
  final double amount;

  AddOrderEvent({
    required this.products,
    required this.count,
    required this.amount,
  });
}
