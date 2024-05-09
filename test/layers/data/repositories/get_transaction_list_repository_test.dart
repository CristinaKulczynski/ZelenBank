import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_list_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_list_repository_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_list_repository.dart';

class MockGetTransactionListDatasource extends Mock
    implements GetTransactionListRemoteDatasourceImpl {}

void main() {
  late MockGetTransactionListDatasource mockGetTransactionListDatasource;
  late GetTransactionListRepository getTransactionListRepository;

  setUp(() {
    mockGetTransactionListDatasource = MockGetTransactionListDatasource();
    getTransactionListRepository =
        GetTransactionListRepositoryImpl(mockGetTransactionListDatasource);
  });

  const int tPageNumber = 0;

  final List<TransactionEntity> tTransactionList = [];

  group('get_transaction_list_repository', () {
    test(
        'Should return a TransactionEntity List from datasource when a int pageNumber is passed as parameter',
        () async {
      // arrange
      when(() => mockGetTransactionListDatasource(tPageNumber))
          .thenAnswer((_) async => Right(tTransactionList));
      // act
      final result = await getTransactionListRepository(tPageNumber);

      // assert
      expect(result, isA<Right>());
      verify(() => mockGetTransactionListDatasource(any())).called(1);
    });

    test('Should return a Failure from datasource', () async {
      // arrange
      when(() => mockGetTransactionListDatasource(tPageNumber))
          .thenAnswer((_) async => Left(GeneralFailure('')));
      // act
      final result = await getTransactionListRepository(tPageNumber);

      // assert
      expect(result, isA<Left>());
      verify(() => mockGetTransactionListDatasource(any())).called(1);
    });
  });
}
