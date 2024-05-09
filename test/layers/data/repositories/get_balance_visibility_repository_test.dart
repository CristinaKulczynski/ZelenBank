import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/data/datasources/local/get_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_balance_visibility_resository_impl.dart';
import 'package:zelenbank/layers/domain/repositories/get_balance_visibility_resository.dart';

class MockGetBalanceVisibilityDatasourceImpl extends Mock
    implements GetBalanceVisibilityDatasourceImpl {}

void main() {
  late MockGetBalanceVisibilityDatasourceImpl
      mockGetBalanceVisibilityDatasourceImpl;
  late GetBalanceVisibilityRepository getBalanceVisibilityRepository;

  setUp(() {
    mockGetBalanceVisibilityDatasourceImpl =
        MockGetBalanceVisibilityDatasourceImpl();
    getBalanceVisibilityRepository = GetBalanceVisibilityRepositoryImpl(
        mockGetBalanceVisibilityDatasourceImpl);
  });

  const bool tIsBalanceVisible = true;

  group('get_current_visibility_repository', () {
    test('Should return a bool from the local datasource', () async {
      // arrange
      when(() => mockGetBalanceVisibilityDatasourceImpl())
          .thenAnswer((_) async => tIsBalanceVisible);

      // act
      final result = await getBalanceVisibilityRepository();

      // assert
      expect(result, equals(tIsBalanceVisible));
      verify(() => mockGetBalanceVisibilityDatasourceImpl()).called(1);
    });
  });
}
