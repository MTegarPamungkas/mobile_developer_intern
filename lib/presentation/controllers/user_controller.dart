import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/domain/usecases/get_users.dart';

class UserController extends GetxController with StateMixin<List<User>> {
  final GetUsers getUsers;
  var currentPage = 1;
  var perPage = 10;
  var users = <User>[].obs;
  var isLoadingNextPage = false.obs;
  var isRefreshing = false.obs;
  var hasMoreData = true.obs;

  UserController({required this.getUsers});

  void setDummyData(List<User> users) {
    if (users.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(users, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers({bool reset = false}) async {
    if (reset) {
      currentPage = 1;
      users.clear();
      hasMoreData.value = true;
      change(null, status: RxStatus.loading());
    }

    final failureOrUsers =
        await getUsers(GetUsersParams(page: currentPage, perPage: perPage));
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
      (newUsers) {
        if (newUsers.isNotEmpty) {
          users.addAll(newUsers);
          currentPage++;
          change(users, status: RxStatus.success());
        } else {
          hasMoreData.value = false;
          if (users.isEmpty) {
            change(null, status: RxStatus.empty());
          }
        }
      },
    );
    isLoadingNextPage(false);
    isRefreshing(false);
  }

  void loadNextPage() async {
    if (!isLoadingNextPage.value && hasMoreData.value) {
      isLoadingNextPage(true);
      await fetchUsers();
    }
  }

  Future<void> refreshUsers() async {
    isRefreshing(true);
    await fetchUsers(reset: true);
  }
}
