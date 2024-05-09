import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class GetCurrentBalanceRepository {
  Future<Either<Failure, double>> call();
}
