import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/repositories/check_user_auth_status_repository_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase_impl.dart';

class MockCheckUserAuthStatusRepository extends Mock
    implements CheckUserAuthStatusRepositoryImpl {}

void main() {
  late MockCheckUserAuthStatusRepository mockCheckUserAuthStatusRepository;
  late CheckUserAuthStatusUsecase checkUserAuthStatusUsecase;

  setUp(() {
    mockCheckUserAuthStatusRepository = MockCheckUserAuthStatusRepository();
    checkUserAuthStatusUsecase =
        CheckUserAuthStatusUsecaseImpl(mockCheckUserAuthStatusRepository);
  });

  bool tAuthStatus = false;

  group('check_user_auth_status_usecase', () {
    test('Should return a bool from the repository to check user auth status',
        () {
      // arrange
      when(() => mockCheckUserAuthStatusRepository()).thenReturn(tAuthStatus);

      // act
      final response = checkUserAuthStatusUsecase();

      // assert
      expect(response, isA<bool>());
      verify(() => mockCheckUserAuthStatusRepository()).called(1);
    });
  });
}
