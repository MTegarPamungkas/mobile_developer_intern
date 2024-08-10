import 'package:dartz/dartz.dart';
import 'package:mobile_developer_intern/core/error/exceptions.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/data/datasources/remote/user_remote_data_source.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/domain/repositories/user_repository.dart';
import 'package:mobile_developer_intern/helpers/network_info.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers();
        return Right(remoteUsers);
      } on ServerException {
        return Left(ServerFailure());
      } on TimeoutException {
        return Left(TimeoutFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on UnknownException {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
