import 'package:equatable/equatable.dart';

sealed class RequestResult<T> extends Equatable {}

class Success<T> extends RequestResult<T> {
  final T data;
  Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error<T> extends RequestResult<T> {
  final String message;
  Error(this.message);

  @override
  List<Object?> get props => [message];
}
