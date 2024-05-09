import 'package:dartz/dartz.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_in_with_google_repository.dart';
import 'package:zelenbank/core/errors/failure.dart';

import '../datasources/sign_in_with_google_datasource.dart';

class SignInWithGoogleRepositoryImpl implements SignInWithGoogleRepository {
  final SignInWithGoogleDatasource _signInWithGoogleDatasource;
  SignInWithGoogleRepositoryImpl(this._signInWithGoogleDatasource);

  @override
  Future<Either<Failure, bool>> call() async {
    return await _signInWithGoogleDatasource();
  }
}
