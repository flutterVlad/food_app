part of 'bloc.dart';

abstract class ProductEvent {}

class InitEvent extends ProductEvent {}

class ChangeIndexEvent extends ProductEvent {
  final int newIndex;

  ChangeIndexEvent(this.newIndex);
}
