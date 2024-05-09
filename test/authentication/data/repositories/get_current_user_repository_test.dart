import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/get_current_user_datasource_impl.dart';
import 'package:zelenbank/authentication/data/repositories/get_current_user_repository_impl.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';
import 'package:zelenbank/authentication/domain/repositories/get_current_user_repository.dart';

class MockGetCurrentUserDatasource extends Mock
    implements GetCurrentUserDatasourceImpl {}

void main() {
  late MockGetCurrentUserDatasource mockGetCurrentUserDatasource;
  late GetCurrentUserRepository getCurrentUserRepository;

  setUp(() {
    mockGetCurrentUserDatasource = MockGetCurrentUserDatasource();
    getCurrentUserRepository =
        GetCurrentUserRepositoryImpl(mockGetCurrentUserDatasource);
  });

  final tUserEntity = UserEntity(uid: '', name: '', profilePhotoUrl: '');

  group('get_current_user_repository', () {
    test('Should get an UserEntity from the datasource', () {
      // arrange
      when(() => mockGetCurrentUserDatasource()).thenReturn(tUserEntity);

      // act
      final response = getCurrentUserRepository();

      // assert
      expect(response, isA<UserEntity>());
      verify(() => mockGetCurrentUserDatasource()).called(1);
    });
  });
}
