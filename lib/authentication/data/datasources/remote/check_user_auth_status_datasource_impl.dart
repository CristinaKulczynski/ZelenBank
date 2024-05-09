import 'package:firebase_auth/firebase_auth.dart';
import 'package:zelenbank/authentication/data/datasources/check_user_auth_status_datasource.dart';

class CheckUserAuthStatusDatasourceImpl
    implements CheckUserAuthStatusDatasource {
  final FirebaseAuth _firebaseAuth;
  CheckUserAuthStatusDatasourceImpl(this._firebaseAuth);

  @override
  bool call() {
    return _firebaseAuth.currentUser?.uid != null;
  }
}
