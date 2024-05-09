import 'package:zelenbank/authentication/data/datasources/sign_out_google_datasource.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_out_google_repository.dart';

class SignOutGoogleRepositoryImpl implements SignOutGoogleRepository {
  final SignOutGoogleDatasource _signOutGoogleDatasource;
  SignOutGoogleRepositoryImpl(this._signOutGoogleDatasource);

  @override
  Future<void> call() async {
    await _signOutGoogleDatasource();
  }
}
