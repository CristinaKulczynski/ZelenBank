import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../repositories/get_transaction_list_repository.dart';

class GetTransactionListUsecaseImpl implements GetTransactionListUsecase {
  final GetTransactionListRepository _getTrasactionListRepository;
  GetTransactionListUsecaseImpl(this._getTrasactionListRepository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(int pageNumber) async {
    return await _getTrasactionListRepository(pageNumber);
  }
}
