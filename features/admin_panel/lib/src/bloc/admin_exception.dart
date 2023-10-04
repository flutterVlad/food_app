part of 'admin_bloc.dart';

abstract class AdminException {}

class AdminError extends AdminException {
  final String? exception;

  AdminError(this.exception);

  @override
  String toString() => exception ?? '';
}

class AdminSuccess extends AdminException {
  final String? message;

  AdminSuccess({this.message});

  @override
  String toString() => message ?? '';
}
