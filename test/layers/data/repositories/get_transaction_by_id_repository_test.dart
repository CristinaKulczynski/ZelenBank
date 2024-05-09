import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_by_id_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_by_id_repository_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_by_id_repository.dart';

class MockGetTransactionByIdDatasource extends Mock
    implements GetTransactionByIdRemoteDatasourceImpl {}

void main() {
  late MockGetTransactionByIdDatasource mockGetTransactionByIdDatasource;
  late GetTransactionByIdRepository getTransactionByIdRepository;

  setUp(() {
    mockGetTransactionByIdDatasource = MockGetTransactionByIdDatasource();
    getTransactionByIdRepository =
        GetTransactionByIdRepositoryImpl(mockGetTransactionByIdDatasource);
  });

  const String tTransactionId = 'ABC123';

  final TransactionEntity tTransactionEntity = TransactionEntity(
    id: 'ABC123',
    createdAt: DateTime.now(),
    amount: 123,
    transactionType: '',
    description: '',
    targetName: '',
  );

  group('get_transaction_by_id_repository', () {
    test(
        'Should return a TransactionEntity from datasource when a String id is passed as parameter',
        () async {
      // arrange
      when(() => mockGetTransactionByIdDatasource(tTransactionId))
          .thenAnswer((_) async => Right(tTransactionEntity));
      // act
      final result = await getTransactionByIdRepository(tTransactionId);

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetTransactionByIdDatasource(any())).called(1);
    });

    test('Should return a Failure from datasource', () async {
      // arrange
      when(() => mockGetTransactionByIdDatasource(tTransactionId))
          .thenAnswer((_) async => Left(GeneralFailure('')));
      // act
      final result = await getTransactionByIdRepository(tTransactionId);

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetTransactionByIdDatasource(any())).called(1);
    });
  });
}
