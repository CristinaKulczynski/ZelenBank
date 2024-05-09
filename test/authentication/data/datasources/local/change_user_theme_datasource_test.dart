import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/authentication/data/datasources/change_user_theme_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/local/change_user_theme_local_datasource_impl.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ChangeUserThemeDatasource changeUserThemeDatasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    changeUserThemeDatasource =
        ChangeUserThemeLocalDatasourceImpl(mockSharedPreferences);
  });

  const bool tIsUserThemeDark = true;

  test('Should change the cached value of the variable passed as parameter',
      () async {
    // arrange
    when(() => mockSharedPreferences.setBool(
            kIsUserThemeDarkLocalStorageKey, !tIsUserThemeDark))
        .thenAnswer((_) async => !tIsUserThemeDark);

    // act
    await changeUserThemeDatasource(tIsUserThemeDark);

    // assert
    verify(() => mockSharedPreferences.setBool(
        kIsUserThemeDarkLocalStorageKey, !tIsUserThemeDark)).called(1);
  });
}
