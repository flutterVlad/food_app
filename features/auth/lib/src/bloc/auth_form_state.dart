part of 'auth_bloc.dart';

abstract class FormState {}

class InitFormState extends FormState {}

class SuccessFormState extends FormState {}

class FailureFormState extends FormState {
  final String? exception;

  FailureFormState(this.exception);

  @override
  String toString() => exception ?? '';
}
