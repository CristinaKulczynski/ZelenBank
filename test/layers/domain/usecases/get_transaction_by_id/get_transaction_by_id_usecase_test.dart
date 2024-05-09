import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_by_id_repository_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase_impl.dart';

class MockGetTransactionByIdRepository extends Mock
    implements GetTransactionByIdRepositoryImpl {}

void main() {
  late MockGetTransactionByIdRepository mockGetTransactionByIdRepository;
  late GetTransactionByIdUsecase getTransactionByIdUsecase;

  setUp(() {
    mockGetTransactionByIdRepository = MockGetTransactionByIdRepository();
    getTransactionByIdUsecase =
        GetTransactionByIdUsecaseImpl(mockGetTransactionByIdRepository);
  });

  final date = DateTime.parse('2020-11-29T03:00:00Z');

  final tTransactionDto = TransactionEntity(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: date,
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
  );

  const String tTransactionId = 'ABC123';

  group('get_transaction_by_id_usecase', () {
    test('Should get a TransactionEntity from repository', () async {
      // arrange
      when(() => mockGetTransactionByIdRepository(any()))
          .thenAnswer((_) async => Right(tTransactionDto));

      // act
      final result = await getTransactionByIdUsecase(tTransactionId);

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetTransactionByIdRepository(tTransactionId)).called(1);
    });

    test('Should get a Failure from repository', () async {
      // arrange
      when(() => mockGetTransactionByIdRepository(any()))
          .thenAnswer((_) async => Left(GeneralFailure('')));

      // act
      final result = await getTransactionByIdUsecase(tTransactionId);

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetTransactionByIdRepository(tTransactionId)).called(1);
    });
  });
}
