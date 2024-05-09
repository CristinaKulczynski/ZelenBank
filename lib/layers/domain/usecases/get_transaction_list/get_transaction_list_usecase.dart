import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class GetTransactionListUsecase {
  Future<Either<Failure, List<TransactionEntity>>> call(int pageNumber);
}
