part of 'history_bloc.dart';

class HistoryEvent {}

class InitHistoryEvent extends HistoryEvent {
  final UserModel user;

  InitHistoryEvent({
    required this.user,
  });
}

class AddOrderEvent extends HistoryEvent {
  final CartModel cartModel;

  AddOrderEvent({
    required this.cartModel,
  });
}

class OpenTileEvent extends HistoryEvent {
  final int index;

  OpenTileEvent({
    required this.index,
  });
}
