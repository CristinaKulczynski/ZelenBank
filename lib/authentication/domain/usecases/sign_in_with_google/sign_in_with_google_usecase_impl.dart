import 'package:dartz/dartz.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_in_with_google_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase.dart';
import 'package:zelenbank/core/errors/failure.dart';

class SignInWithGoogleUsecaseImpl implements SignInWithGoogleUsecase {
  final SignInWithGoogleRepository _signInWithGoogleRepository;
  SignInWithGoogleUsecaseImpl(this._signInWithGoogleRepository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await _signInWithGoogleRepository();
  }
}
