import 'package:zelenbank/authentication/domain/repositories/check_user_auth_status_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase.dart';

class CheckUserAuthStatusUsecaseImpl implements CheckUserAuthStatusUsecase {
  final CheckUserAuthStatusRepository _checkUserAuthStatusRepository;
  CheckUserAuthStatusUsecaseImpl(this._checkUserAuthStatusRepository);

  @override
  bool call() {
    return _checkUserAuthStatusRepository();
  }
}
