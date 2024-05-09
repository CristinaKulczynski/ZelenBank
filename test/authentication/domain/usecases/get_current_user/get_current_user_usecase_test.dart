import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/repositories/get_current_user_repository_impl.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase_impl.dart';

class MockGetCurrentUserRepository extends Mock
    implements GetCurrentUserRepositoryImpl {}

void main() {
  late MockGetCurrentUserRepository mockGetCurrentUserRepository;
  late GetCurrentUserUsecase getCurrentUserUsecase;

  setUp(() {
    mockGetCurrentUserRepository = MockGetCurrentUserRepository();
    getCurrentUserUsecase =
        GetCurrentUserUsecaseImpl(mockGetCurrentUserRepository);
  });

  final tUserEntity = UserEntity(uid: '', name: '', profilePhotoUrl: '');

  group('get_current_user_usecase', () {
    test('Should get an UserEntity from the repository', () {
      // arrange
      when(() => mockGetCurrentUserRepository()).thenReturn(tUserEntity);

      // act
      final response = getCurrentUserUsecase();

      // assert
      expect(response, isA<UserEntity>());
      verify(() => mockGetCurrentUserRepository()).called(1);
    });
  });
}
