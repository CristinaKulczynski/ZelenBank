import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_list_repository_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase_impl.dart';

class MockGetTransactionListRepository extends Mock
    implements GetTransactionListRepositoryImpl {}

void main() {
  late MockGetTransactionListRepository mockGetTransactionListRepository;
  late GetTransactionListUsecase getTransactionListUsecase;

  setUp(() {
    mockGetTransactionListRepository = MockGetTransactionListRepository();
    getTransactionListUsecase =
        GetTransactionListUsecaseImpl(mockGetTransactionListRepository);
  });

  final List<TransactionEntity> list = [];

  const int tPageNumber = 0;

  group('get_transaction_list_usecase', () {
    test('Should get a List of TransactionEntity from repository', () async {
      // arrange
      when(() => mockGetTransactionListRepository(any()))
          .thenAnswer((_) async => Right(list));

      // act
      final result = await getTransactionListUsecase(tPageNumber);

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetTransactionListRepository(any())).called(1);
    });

    test('Should get a Failure from repository', () async {
      // arrange
      when(() => mockGetTransactionListRepository(any()))
          .thenAnswer((_) async => Left(GeneralFailure('')));

      // act
      final result = await getTransactionListUsecase(tPageNumber);

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetTransactionListRepository(any())).called(1);
    });
  });
}
