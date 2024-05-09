import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_current_balance_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_current_balance_repository_impl.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';

class MockGetCurrentBalanceRemoteDatasource extends Mock
    implements GetCurrentBalanceRemoteDatasourceImpl {}

void main() {
  late MockGetCurrentBalanceRemoteDatasource mockGetCurrentBalanceRepository;
  late GetCurrentBalanceRepository getCurrentBalanceRepository;

  setUp(() {
    mockGetCurrentBalanceRepository = MockGetCurrentBalanceRemoteDatasource();
    getCurrentBalanceRepository =
        GetCurrentBalanceRepositoryImpl(mockGetCurrentBalanceRepository);
  });

  const double tNumber = 1;

  group('get_current_balance_repository', () {
    test('Should return a double number from the datasource', () async {
      // arrange
      when(() => mockGetCurrentBalanceRepository())
          .thenAnswer((_) async => const Right(tNumber));

      // act
      final result = await getCurrentBalanceRepository();

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetCurrentBalanceRepository()).called(1);
    });

    test('Should return a Failure from the datasource', () async {
      // arrange
      when(() => mockGetCurrentBalanceRepository())
          .thenAnswer((_) async => Left(GeneralFailure('')));

      // act
      final result = await getCurrentBalanceRepository();

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetCurrentBalanceRepository()).called(1);
    });
  });
}
