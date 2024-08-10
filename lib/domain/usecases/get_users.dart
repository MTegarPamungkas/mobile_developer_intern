import 'package:dartz/dartz.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/core/usecases/usecase.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/domain/repositories/user_repository.dart';

class GetUsersParams {
  final int page;
  final int perPage;

  GetUsersParams({required this.page, required this.perPage});
}

class GetUsers implements UseCase<List<User>, GetUsersParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(GetUsersParams params) async {
    return await repository.getUsers(params.page, params.perPage);
  }
}
