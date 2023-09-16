part of 'history_bloc.dart';

class HistoryState {
  final List<OrderModel> orders;
  final UserModel user;
  final List<bool> isTileOpenList;

  HistoryState({
    required this.orders,
    required this.user,
    required this.isTileOpenList,
  });

  HistoryState.empty()
      : orders = [],
        user = UserModel.empty,
        isTileOpenList = [];

  HistoryState copyWith({
    List<OrderModel>? orders,
    UserModel? user,
    List<bool>? isTileOpenList,
  }) =>
      HistoryState(
        orders: orders ?? this.orders,
        user: user ?? this.user,
        isTileOpenList: isTileOpenList ?? this.isTileOpenList,
      );
}
