import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../sign_out_google_datasource.dart';

class SignOutGoogleDatasourceImpl implements SignOutGoogleDatasource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  SignOutGoogleDatasourceImpl(this._firebaseAuth, this._googleSignIn);

  @override
  Future<void> call() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
