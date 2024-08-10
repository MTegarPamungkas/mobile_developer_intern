import 'package:dartz/dartz.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
