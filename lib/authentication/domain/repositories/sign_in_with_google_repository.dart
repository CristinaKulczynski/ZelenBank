import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class SignInWithGoogleRepository {
  Future<Either<Failure, bool>> call();
}
