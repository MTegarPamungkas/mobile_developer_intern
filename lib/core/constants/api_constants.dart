class ApiConstants {
  static const String baseUrl = 'https://reqres.in/api';

  static String getUsers({int page = 1, int perPage = 10}) {
    return '$baseUrl/users?page=$page&per_page=$perPage';
  }
}
