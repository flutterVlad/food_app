part of 'history_bloc.dart';

class HistoryState {
  final List<OrderModel> orders;
  final String uid;

  HistoryState({
    required this.orders,
    required this.uid
  });

  HistoryState copyWith({
    List<OrderModel>? orders,
    String? uid,
  }) =>
      HistoryState(
        orders: orders ?? this.orders,
        uid: uid ?? this.uid,
      );

  HistoryState.empty() : orders = [], uid = '';
}
