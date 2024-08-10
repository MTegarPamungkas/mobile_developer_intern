import 'package:dio/dio.dart';
import 'package:mobile_developer_intern/core/constants/api_constants.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/core/error/exceptions.dart';
import 'package:mobile_developer_intern/helpers/network_info.dart';

class DioClient {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  DioClient(this._dio, this._networkInfo) {
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 3)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
  }

  Future<Response?> get(String uri,
      {Map<String, dynamic>? queryParameters}) async {
    if (!await _networkInfo.isConnected) {
      throw NoInternetException(TextConstants.noInternetConnection);
    }

    try {
      final Response response =
          await _dio.get(uri, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoInternetException(TextConstants.noInternetConnection);
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw TimeoutException(TextConstants.requestTimedOut);
      } else {
        throw ServerException(TextConstants.serverErrorOccurred);
      }
    } catch (e) {
      throw UnknownException(TextConstants.anUnexpectedErrorOccurred);
    }
  }
}
