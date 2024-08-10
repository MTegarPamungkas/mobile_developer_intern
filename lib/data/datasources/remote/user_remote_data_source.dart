import 'package:dio/dio.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/core/error/exceptions.dart';
import 'package:mobile_developer_intern/core/constants/api_constants.dart';
import 'package:mobile_developer_intern/core/network/dio_client.dart';
import 'package:mobile_developer_intern/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient dioClient;

  UserRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dioClient.get(ApiConstants.getUsers);

      if (response?.statusCode == 200) {
        final data = response?.data['data'];
        if (data is List) {
          return data.map((user) => UserModel.fromJson(user)).toList();
        } else {
          throw ServerException(TextConstants.unexpectedDataFormat);
        }
      } else {
        throw ServerException(TextConstants.failedToFetchDataFromServer);
      }
    } on NoInternetException {
      throw NoInternetException(TextConstants.noInternetConnection);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoInternetException(TextConstants.noInternetConnection);
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw TimeoutException(TextConstants.requestTimedOut);
      } else if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            '${TextConstants.receivedInvalidStatusCode} ${e.response?.statusCode}');
      } else {
        throw ServerException(
            '${TextConstants.serverErrorOccurred}: ${e.message}');
      }
    } catch (e) {
      throw UnknownException(
          '${TextConstants.anUnexpectedErrorOccurred} : ${e.toString()}');
    }
  }
}
