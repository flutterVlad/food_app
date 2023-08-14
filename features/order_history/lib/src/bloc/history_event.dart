part of 'history_bloc.dart';

class HistoryEvent {}

class InitHistoryEvent extends HistoryEvent {
  final String uid;

  InitHistoryEvent({
    required this.uid,
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
