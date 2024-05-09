import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/repositories/get_user_theme_repository_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/get_user_theme/get_user_theme_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/get_user_theme/get_user_theme_usecase_impl.dart';

class MockGetUserThemeRepository extends Mock
    implements GetUserThemeRepositoryImpl {}

void main() {
  late MockGetUserThemeRepository mockGetUserThemeRepository;
  late GetUserThemeUsecase getUserThemeUsecase;

  setUp(() {
    mockGetUserThemeRepository = MockGetUserThemeRepository();
    getUserThemeUsecase = GetUserThemeUsecaseImpl(mockGetUserThemeRepository);
  });

  const bool tIsDarkTheme = false;

  group('get_user_theme_usecase', () {
    test('Should return a boolean from the repository', () {
      // arrange
      when(() => mockGetUserThemeRepository()).thenAnswer((_) => tIsDarkTheme);

      // act
      final response = getUserThemeUsecase();

      // assert
      expect(response, tIsDarkTheme);
      verify(() => mockGetUserThemeRepository()).called(1);
    });
  });
}
