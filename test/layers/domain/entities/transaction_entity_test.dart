import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

void main() {
  final tTransactionEntity = TransactionEntity(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: DateTime.parse('2020-11-29T03:00:00Z'),
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
  );
  var tTransactionProps = tTransactionEntity.props;

  group('transaction_entity', () {
    test('Should be an instance of TransactionEntity', () {
      expect(tTransactionEntity, isA<TransactionEntity>());
    });
    test('Should include all required fields', () {
      expect(tTransactionProps.length, greaterThanOrEqualTo(6));
    });
  });
}
