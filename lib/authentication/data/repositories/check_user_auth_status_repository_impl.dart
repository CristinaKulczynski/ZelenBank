import 'package:zelenbank/authentication/domain/repositories/check_user_auth_status_repository.dart';

import '../datasources/check_user_auth_status_datasource.dart';

class CheckUserAuthStatusRepositoryImpl
    implements CheckUserAuthStatusRepository {
  final CheckUserAuthStatusDatasource _checkUserAuthStatusDatasource;
  CheckUserAuthStatusRepositoryImpl(this._checkUserAuthStatusDatasource);

  @override
  bool call() {
    return _checkUserAuthStatusDatasource();
  }
}
