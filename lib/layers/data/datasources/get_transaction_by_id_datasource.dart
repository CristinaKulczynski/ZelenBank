import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../core/errors/failure.dart';

abstract class GetTransactionByIdDatasource {
  Future<Either<Failure, TransactionEntity>> call(String id);
}
