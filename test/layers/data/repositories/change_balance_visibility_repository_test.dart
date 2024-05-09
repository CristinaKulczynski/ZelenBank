import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/data/datasources/local/change_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/change_balance_visibility_repository_impl.dart';
import 'package:zelenbank/layers/domain/repositories/change_balance_visibility_repository.dart';

class MockChangeBalanceVisibilityLocalDatasourceImpl extends Mock
    implements ChangeBalanceVisibilityLocalDatasourceImpl {}

void main() {
  late MockChangeBalanceVisibilityLocalDatasourceImpl
      mockChangeBalanceVisibilityLocalDatasourceImpl;
  late ChangeBalanceVisibilityRepository changeBalanceVisibilityRepository;

  setUp(() {
    mockChangeBalanceVisibilityLocalDatasourceImpl =
        MockChangeBalanceVisibilityLocalDatasourceImpl();
    changeBalanceVisibilityRepository = ChangeBalanceVisibilityRepositoryImpl(
        mockChangeBalanceVisibilityLocalDatasourceImpl);
  });

  const bool tIsBalanceVisible = true;

  group('change_visibility_repository', () {
    test('Should return a bool from the local datasource', () async {
      // arrange
      when(() =>
              mockChangeBalanceVisibilityLocalDatasourceImpl(tIsBalanceVisible))
          .thenAnswer((_) async => !tIsBalanceVisible);

      // act
      await changeBalanceVisibilityRepository(tIsBalanceVisible);

      // assert
      verify(() =>
              mockChangeBalanceVisibilityLocalDatasourceImpl(tIsBalanceVisible))
          .called(1);
    });
  });
}
