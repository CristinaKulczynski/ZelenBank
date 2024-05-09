import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/transaction_entity.dart';

abstract class GetTransactionByIdRepository {
  Future<Either<Failure, TransactionEntity>> call(String id);
}
