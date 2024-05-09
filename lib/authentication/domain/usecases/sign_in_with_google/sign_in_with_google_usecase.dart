import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SignInWithGoogleUsecase {
  Future<Either<Failure, bool>> call();
}
