import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class NoInternetFailure extends Failure {}

class UnknownFailure extends Failure {}

class TimeoutFailure extends Failure {}
