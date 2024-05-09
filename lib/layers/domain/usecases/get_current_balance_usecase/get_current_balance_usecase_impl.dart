import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../repositories/get_current_balance_repository.dart';

class GetCurrentBalanceUsecaseImpl implements GetCurrentBalanceUsecase {
  final GetCurrentBalanceRepository _getCurrentBalanceRepository;
  GetCurrentBalanceUsecaseImpl(this._getCurrentBalanceRepository);

  @override
  Future<Either<Failure, double>> call() async {
    return await _getCurrentBalanceRepository();
  }
}
