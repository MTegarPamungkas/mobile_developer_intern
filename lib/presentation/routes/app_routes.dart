import 'package:get/get.dart';
import 'package:mobile_developer_intern/presentation/bindings/home_binding.dart';
import 'package:mobile_developer_intern/presentation/bindings/login_binding.dart';
import 'package:mobile_developer_intern/presentation/bindings/user_binding.dart';
import 'package:mobile_developer_intern/presentation/pages/home_page.dart';
import 'package:mobile_developer_intern/presentation/pages/user_page.dart';
import 'package:mobile_developer_intern/presentation/pages/login_page.dart';

class AppRoutes {
  static const String user = '/user';
  static const String login = '/login';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(
      name: user,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
