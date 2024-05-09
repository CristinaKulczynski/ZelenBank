import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/check_user_auth_status_datasource_impl.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late CheckUserAuthStatusDatasourceImpl checkUserAuthStatusDatasource;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    checkUserAuthStatusDatasource =
        CheckUserAuthStatusDatasourceImpl(mockFirebaseAuth);
  });

  final bool tIsUserLogged = false;

  test('Should return a boolean from the datasource', () {
    // act
    final result = checkUserAuthStatusDatasource();

    // assert
    expect(tIsUserLogged, equals(result));
  });
}
