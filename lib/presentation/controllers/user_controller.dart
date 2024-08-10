import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/core/usecases/usecase.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/domain/usecases/get_users.dart';

class UserController extends GetxController with StateMixin<List<User>> {
  final GetUsers getUsers;

  UserController({required this.getUsers});

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    change(null, status: RxStatus.loading());

    final failureOrUsers = await getUsers(NoParams());
    failureOrUsers.fold(
      (failure) {
        if (failure is NoInternetFailure) {
          change(null,
              status: RxStatus.error(
                  TextConstants.noInternetConnectionPleaseTryAgain));
        } else if (failure is ServerFailure) {
          change(null,
              status: RxStatus.error(
                  TextConstants.failedToFetchDataPleaseTryAgain));
        } else if (failure is TimeoutFailure) {
          change(null,
              status:
                  RxStatus.error(TextConstants.requestTimedOutPleaseTryAgain));
        } else if (failure is UnknownFailure) {
          change(null,
              status: RxStatus.error(TextConstants.anUnexpectedErrorOccurred));
        }
      },
      (users) {
        if (users.isNotEmpty) {
          change(users, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      },
    );
  }
}
