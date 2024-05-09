import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/change_user_theme_datasource.dart';
import 'package:zelenbank/authentication/data/repositories/change_user_theme_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/change_user_theme_repository.dart';

class MockChangeUserThemeDatasource extends Mock
    implements ChangeUserThemeDatasource {}

void main() {
  late MockChangeUserThemeDatasource mockChangeUserThemeDatasource;
  late ChangeUserThemeRepository changeUserThemeRepository;

  setUp(() {
    mockChangeUserThemeDatasource = MockChangeUserThemeDatasource();
    changeUserThemeRepository =
        ChangeUserThemeRepositoryImpl(mockChangeUserThemeDatasource);
  });

  const bool tIsDarkTheme = false;

  group('change_user_theme_repository', () {
    test('Should call the datasource once to change the value of the key',
        () async {
      // arrange
      when(() => mockChangeUserThemeDatasource(tIsDarkTheme))
          .thenAnswer((_) async => !tIsDarkTheme);

      // act
      await changeUserThemeRepository(tIsDarkTheme);

      // assert
      verify(() => mockChangeUserThemeDatasource(tIsDarkTheme)).called(1);
    });
  });
}
