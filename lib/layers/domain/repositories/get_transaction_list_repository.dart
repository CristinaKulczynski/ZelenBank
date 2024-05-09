import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/transaction_entity.dart';

abstract class GetTransactionListRepository {
  Future<Either<Failure, List<TransactionEntity>>> call(int pageNumber);
}
