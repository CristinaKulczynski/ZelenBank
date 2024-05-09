import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zelenbank/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';

import '../sign_in_with_google_datasource.dart';

class SignInWithGoogleDatasourceImpl implements SignInWithGoogleDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  SignInWithGoogleDatasourceImpl(
    this._firebaseFirestore,
    this._firebaseAuth,
  );

  @override
  Future<Either<Failure, bool>> call() async {
    var result = false;
    try {
      // Triggers the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      // Obtains the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Creates a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null && userCredential.additionalUserInfo!.isNewUser) {
        // Add the data to the firebase
        _firebaseFirestore.collection('users').doc(user.uid).set(
          {
            'uid': user.uid,
            'userName': user.displayName,
            'profilePhotoUrl': user.photoURL,
          },
        );
        result = true;
      } else if (user != null) {
        result = true;
      }

      return Right(result);
    } catch (e) {
      return Left(GeneralFailure('Error'));
    }
  }
}
