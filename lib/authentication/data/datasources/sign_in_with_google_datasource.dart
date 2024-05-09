import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class SignInWithGoogleDatasource {
  Future<Either<Failure, bool>> call();
}
