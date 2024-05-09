import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/authentication/data/datasources/local/get_user_theme_local_datasource_impl.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late GetUserThemeLocalDatasourceImpl getUserThemeDatasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    getUserThemeDatasource =
        GetUserThemeLocalDatasourceImpl(mockSharedPreferences);
  });

  const bool tIsUserThemeDark = true;

  test(
      'Should return a bool (true or false) when looking for the cached user theme and the key exists',
      () async {
    // arrange
    when(() =>
            mockSharedPreferences.containsKey(kIsUserThemeDarkLocalStorageKey))
        .thenAnswer((_) => true);
    when(() => mockSharedPreferences.getBool(any()))
        .thenAnswer((_) => tIsUserThemeDark);

    // act
    final result = getUserThemeDatasource();

    // assert
    verify(
        () => mockSharedPreferences.getBool(kIsUserThemeDarkLocalStorageKey));
    expect(result, isA<bool>());
  });
}
