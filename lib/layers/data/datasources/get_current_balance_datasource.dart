import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class GetCurrentBalanceDatasource {
  Future<Either<Failure, double>> call();
}
