import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/repositories/get_current_balance_repository_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase_impl.dart';

class MockGetCurrentBalanceRepository extends Mock
    implements GetCurrentBalanceRepositoryImpl {}

void main() {
  late MockGetCurrentBalanceRepository mockGetCurrentBalanceRepository;
  late GetCurrentBalanceUsecase getCurrentBalanceUsecase;

  setUp(() {
    mockGetCurrentBalanceRepository = MockGetCurrentBalanceRepository();
    getCurrentBalanceUsecase =
        GetCurrentBalanceUsecaseImpl(mockGetCurrentBalanceRepository);
  });

  const double tNumber = 1;

  group('get_current_balance_usecase', () {
    test('Should get a double number from the repository', () async {
      // arrange
      when(() => mockGetCurrentBalanceRepository())
          .thenAnswer((_) async => const Right(tNumber));

      // act
      final result = await getCurrentBalanceUsecase();

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetCurrentBalanceRepository()).called(1);
    });

    test('Should get a Failure from the repository', () async {
      // arrange
      when(() => mockGetCurrentBalanceRepository())
          .thenAnswer((_) async => Left(GeneralFailure('')));

      // act
      final result = await getCurrentBalanceUsecase();

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetCurrentBalanceRepository()).called(1);
    });
  });
}
