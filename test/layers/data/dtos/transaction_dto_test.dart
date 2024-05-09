import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final date = DateTime.parse('2020-11-29T03:00:00Z');

  final tTransactionDto = TransactionDto(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: date,
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
    bankName: 'BANK',
    authentication: 'ABC123',
  );

  group('transaction_dto', () {
    test(
      'Should be a subclass of TransactionEntity',
      () async {
        // assert
        expect(tTransactionDto, isA<TransactionEntity>());
      },
    );

    test('Should return a parsed TransactionDto object when sending a json',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('transaction.json'));

      // act
      final result = TransactionDto.fromMap(jsonMap);

      // assert
      expect(result, tTransactionDto);
    });
  });
}
