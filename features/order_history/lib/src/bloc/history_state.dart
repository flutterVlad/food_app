part of 'history_bloc.dart';

class HistoryState {
  final List<OrderModel> orders;
  final String uid;
  final List<bool> isTileOpenList;

  HistoryState({
    required this.orders,
    required this.uid,
    required this.isTileOpenList,
  });

  HistoryState.empty()
      : orders = [],
        uid = '',
        isTileOpenList = [];

  HistoryState copyWith({
    List<OrderModel>? orders,
    String? uid,
    List<bool>? isTileOpenList,
  }) =>
      HistoryState(
        orders: orders ?? this.orders,
        uid: uid ?? this.uid,
        isTileOpenList: isTileOpenList ?? this.isTileOpenList,
      );
}
