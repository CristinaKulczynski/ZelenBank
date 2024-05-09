import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase.dart';

import '../../repositories/sign_out_google_repository.dart';

class SignOutGoogleUsecaseImpl implements SignOutGoogleUsecase {
  final SignOutGoogleRepository _signOutGoogleRepository;
  SignOutGoogleUsecaseImpl(this._signOutGoogleRepository);

  @override
  Future<void> call() async {
    await _signOutGoogleRepository();
  }
}
