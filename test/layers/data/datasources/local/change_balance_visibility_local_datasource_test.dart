import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';
import 'package:zelenbank/layers/data/datasources/local/change_balance_visibility_local_datasource_impl.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ChangeBalanceVisibilityLocalDatasourceImpl
      changeBalanceVisibilityDatasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    changeBalanceVisibilityDatasource =
        ChangeBalanceVisibilityLocalDatasourceImpl(mockSharedPreferences);
  });

  const bool tIsBalanceVisible = true;

  test('Should change the cached value of the variable passed as parameter',
      () async {
    // arrange
    when(() => mockSharedPreferences.setBool(
            kIsBalanceVisibleLocalStorageKey, !tIsBalanceVisible))
        .thenAnswer((_) async => !tIsBalanceVisible);

    // act
    await changeBalanceVisibilityDatasource(tIsBalanceVisible);

    // assert
    verify(() => mockSharedPreferences.setBool(
        kIsBalanceVisibleLocalStorageKey, !tIsBalanceVisible)).called(1);
  });
}
