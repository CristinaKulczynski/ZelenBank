import 'package:dartz/dartz.dart';
import 'package:zelenbank/core/errors/failure.dart';

abstract class GetCurrentBalanceUsecase {
  Future<Either<Failure, double>> call();
}