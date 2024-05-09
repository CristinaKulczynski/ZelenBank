import 'package:firebase_auth/firebase_auth.dart';
import 'package:zelenbank/authentication/data/datasources/get_current_user_datasource.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';

class GetCurrentUserDatasourceImpl implements GetCurrentUserDatasource {
  final FirebaseAuth _firebaseAuth;
  GetCurrentUserDatasourceImpl(this._firebaseAuth);

  @override
  UserEntity call() {
    final UserEntity currentUser = UserEntity(
      uid: _firebaseAuth.currentUser!.uid,
      name: _firebaseAuth.currentUser!.displayName!,
      profilePhotoUrl: _firebaseAuth.currentUser!.photoURL!,
    );
    return currentUser;
  }
}
