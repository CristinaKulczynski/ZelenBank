import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/check_user_auth_status_datasource_impl.dart';
import 'package:zelenbank/authentication/data/repositories/check_user_auth_status_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/check_user_auth_status_repository.dart';

class MockCheckUserAuthStatusDatasource extends Mock
    implements CheckUserAuthStatusDatasourceImpl {}

void main() {
  late MockCheckUserAuthStatusDatasource mockCheckUserAuthStatusDatasource;
  late CheckUserAuthStatusRepository checkUserAuthStatusRepository;

  setUp(() {
    mockCheckUserAuthStatusDatasource = MockCheckUserAuthStatusDatasource();
    checkUserAuthStatusRepository =
        CheckUserAuthStatusRepositoryImpl(mockCheckUserAuthStatusDatasource);
  });

  bool tAuthStatus = false;

  group('check_user_auth_status_repository', () {
    test('Should return a bool from the datasource to check user auth status',
        () {
      // arrange
      when(() => mockCheckUserAuthStatusDatasource()).thenReturn(tAuthStatus);

      // act
      final response = checkUserAuthStatusRepository();

      // assert
      expect(response, isA<bool>());
      verify(() => mockCheckUserAuthStatusDatasource()).called(1);
    });
  });
}
