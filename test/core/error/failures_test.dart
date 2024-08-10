import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_developer_intern/core/error/failures.dart';

void main() {
  test('ServerFailure should have the same properties', () {
    final failure1 = ServerFailure();
    final failure2 = ServerFailure();

    expect(failure1, equals(failure2));
  });
}
