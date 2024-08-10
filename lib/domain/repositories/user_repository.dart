import 'package:dartz/dartz.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers(int page, int perPage);
}
