import 'package:zelenbank/authentication/domain/entities/user_entity.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase.dart';

import '../../repositories/get_current_user_repository.dart';

class GetCurrentUserUsecaseImpl implements GetCurrentUserUsecase {
  final GetCurrentUserRepository _getCurrentUserRepository;
  GetCurrentUserUsecaseImpl(this._getCurrentUserRepository);

  @override
  UserEntity call() {
    return _getCurrentUserRepository();
  }
}
