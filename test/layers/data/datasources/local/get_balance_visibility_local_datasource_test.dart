import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';
import 'package:zelenbank/layers/data/datasources/local/get_balance_visibility_local_datasource_impl.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late GetBalanceVisibilityDatasourceImpl getBalanceVisibilityDatasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    getBalanceVisibilityDatasource =
        GetBalanceVisibilityDatasourceImpl(mockSharedPreferences);
  });

  const bool tIsBalanceVisible = true;

  test(
      'Should return a bool (true or false) when looking for the cached balance visibility and the key exists',
      () async {
    // arrange
    when(() =>
            mockSharedPreferences.containsKey(kIsBalanceVisibleLocalStorageKey))
        .thenAnswer((_) => true);
    when(() => mockSharedPreferences.getBool(any()))
        .thenAnswer((_) => tIsBalanceVisible);

    // act
    final result = await getBalanceVisibilityDatasource();

    // assert
    verify(
        () => mockSharedPreferences.getBool(kIsBalanceVisibleLocalStorageKey));
    expect(result, isA<bool>());
  });

  test(
      'Should return a bool (true) when looking for the cached balance visibility and the key doesnt exist',
      () async {
    // arrange
    when(() =>
            mockSharedPreferences.containsKey(kIsBalanceVisibleLocalStorageKey))
        .thenAnswer((_) => false);
    when(() => mockSharedPreferences.setBool(
            kIsBalanceVisibleLocalStorageKey, tIsBalanceVisible))
        .thenAnswer((_) async => !tIsBalanceVisible);

    // act
    final result = await getBalanceVisibilityDatasource();

    // assert
    expect(result, true);
    verify(() => mockSharedPreferences.setBool(
        kIsBalanceVisibleLocalStorageKey, true)).called(1);
  });
}
