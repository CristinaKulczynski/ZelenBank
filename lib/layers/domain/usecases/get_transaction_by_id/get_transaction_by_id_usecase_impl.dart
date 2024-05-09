import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_by_id_repository.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';

import '../../../../core/errors/failure.dart';

class GetTransactionByIdUsecaseImpl implements GetTransactionByIdUsecase {
  final GetTransactionByIdRepository _getTransactionByIdRepository;
  GetTransactionByIdUsecaseImpl(this._getTransactionByIdRepository);

  @override
  Future<Either<Failure, TransactionEntity>> call(String id) async {
    return await _getTransactionByIdRepository(id);
  }
}
