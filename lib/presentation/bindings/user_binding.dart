import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/network/dio_client.dart';
import 'package:mobile_developer_intern/data/datasources/remote/user_remote_data_source.dart';
import 'package:mobile_developer_intern/data/repositories/user_repository_impl.dart';
import 'package:mobile_developer_intern/domain/repositories/user_repository.dart';
import 'package:mobile_developer_intern/domain/usecases/get_users.dart';
import 'package:mobile_developer_intern/helpers/network_info.dart';
import 'package:mobile_developer_intern/presentation/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());

    Get.lazyPut(() => Connectivity());

    Get.lazyPut(() => DioClient(Get.find<Dio>(), Get.find<NetworkInfo>()));

    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find<Connectivity>()));

    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(dioClient: Get.find<DioClient>()),
    );

    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(
        remoteDataSource: Get.find<UserRemoteDataSource>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );

    Get.lazyPut(
      () => GetUsers(Get.find<UserRepository>()),
    );

    Get.lazyPut(
      () => UserController(getUsers: Get.find<GetUsers>()),
    );
  }
}
