import 'package:dartz/dartz.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/core/usecases/usecase.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/domain/repositories/user_repository.dart';

class GetUsers implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repository.getUsers();
  }
}
