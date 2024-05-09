import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class GetTransactionListDatasource {
  Future<Either<Failure, List<TransactionEntity>>> call(int pageNumber);
}
