import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/local/get_user_theme_local_datasource_impl.dart';
import 'package:zelenbank/authentication/data/repositories/get_user_theme_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/get_user_theme_repository.dart';

class MockGetUserThemeDatasource extends Mock
    implements GetUserThemeLocalDatasourceImpl {}

void main() {
  late MockGetUserThemeDatasource mockGetUserThemeDatasource;
  late GetUserThemeRepository getUserThemeRepository;

  setUp(() {
    mockGetUserThemeDatasource = MockGetUserThemeDatasource();
    getUserThemeRepository =
        GetUserThemeRepositoryImpl(mockGetUserThemeDatasource);
  });

  const bool tIsDarkTheme = false;

  group('get_user_theme_repository', () {
    test('Should return a boolean from the datasource', () {
      // arrange
      when(() => mockGetUserThemeDatasource()).thenAnswer((_) => tIsDarkTheme);

      // act
      final response = getUserThemeRepository();

      // assert
      expect(response, tIsDarkTheme);
      verify(() => mockGetUserThemeDatasource()).called(1);
    });
  });
}
