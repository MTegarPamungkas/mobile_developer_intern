import 'package:mobile_developer_intern/core/constants/text_constants.dart';

class ServerException implements Exception {
  final String message;

  ServerException([this.message = TextConstants.serverErrorOccurred]);

  @override
  String toString() => message;
}

class NoInternetException implements Exception {
  final String message;

  NoInternetException([this.message = TextConstants.noInternetConnection]);

  @override
  String toString() => message;
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException([this.message = TextConstants.requestTimedOut]);

  @override
  String toString() => message;
}

class UnknownException implements Exception {
  final String message;

  UnknownException([this.message = TextConstants.anUnexpectedErrorOccurred]);

  @override
  String toString() => message;
}
