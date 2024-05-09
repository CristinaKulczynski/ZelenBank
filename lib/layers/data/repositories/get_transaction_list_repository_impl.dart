import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../core/errors/failure.dart';
import '../../domain/repositories/get_transaction_list_repository.dart';
import '../datasources/get_transaction_list_datasource.dart';

class GetTransactionListRepositoryImpl implements GetTransactionListRepository {
  final GetTransactionListDatasource _getTrasactionListDatasource;
  GetTransactionListRepositoryImpl(this._getTrasactionListDatasource);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(int pageNumber) async {
    return await _getTrasactionListDatasource(pageNumber);
  }
}
