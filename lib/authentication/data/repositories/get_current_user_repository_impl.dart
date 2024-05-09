import 'package:zelenbank/authentication/domain/entities/user_entity.dart';
import 'package:zelenbank/authentication/domain/repositories/get_current_user_repository.dart';

import '../datasources/get_current_user_datasource.dart';

class GetCurrentUserRepositoryImpl implements GetCurrentUserRepository {
  final GetCurrentUserDatasource _getCurrentUserDatasource;
  GetCurrentUserRepositoryImpl(this._getCurrentUserDatasource);

  @override
  UserEntity call() {
    return _getCurrentUserDatasource();
  }
}
