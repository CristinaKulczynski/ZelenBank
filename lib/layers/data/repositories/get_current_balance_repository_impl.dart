import 'package:dartz/dartz.dart';
import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';

import '../../../core/errors/failure.dart';

class GetCurrentBalanceRepositoryImpl implements GetCurrentBalanceRepository {
  final GetCurrentBalanceDatasource _getCurrentBalanceDatasource;
  GetCurrentBalanceRepositoryImpl(this._getCurrentBalanceDatasource);

  @override
  Future<Either<Failure, double>> call() async {
    return await _getCurrentBalanceDatasource();
  }
}
