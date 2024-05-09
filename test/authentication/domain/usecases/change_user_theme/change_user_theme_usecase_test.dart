import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/domain/repositories/change_user_theme_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/change_user_theme/change_user_theme_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/change_user_theme/change_user_theme_usecase_impl.dart';

class MockChangeUserThemeRepository extends Mock
    implements ChangeUserThemeRepository {}

void main() {
  late MockChangeUserThemeRepository mockChangeUserThemeRepository;
  late ChangeUserThemeUsecase changeUserThemeUsecase;

  setUp(() {
    mockChangeUserThemeRepository = MockChangeUserThemeRepository();
    changeUserThemeUsecase =
        ChangeUserThemeUsecaseImpl(mockChangeUserThemeRepository);
  });

  const bool tIsDarkTheme = false;

  group('change_user_theme_usecase', () {
    test('Should call the repository once to change the value of the key',
        () async {
      // arrange
      when(() => mockChangeUserThemeRepository(tIsDarkTheme))
          .thenAnswer((_) async => !tIsDarkTheme);

      // act
      await changeUserThemeUsecase(tIsDarkTheme);

      // assert
      verify(() => mockChangeUserThemeRepository(tIsDarkTheme)).called(1);
    });
  });
}
