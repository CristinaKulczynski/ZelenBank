import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase.dart';

import '../../domain/usecases/change_user_theme/change_user_theme_usecase.dart';
import '../../domain/usecases/get_user_theme/get_user_theme_usecase.dart';

enum LoginState { idle, loading, success, error }

class AuthController extends ChangeNotifier {
  final CheckUserAuthStatusUsecase _checkUserAuthStatusUsecase;
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final SignOutGoogleUsecase _signOutGoogleUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final GetUserThemeUsecase _getUserThemeUsecase;
  final ChangeUserThemeUsecase _changeUserThemeUsecase;
  late UserEntity currentUser;
  var isLogged = false;
  var loginState = LoginState.idle;
  var isUserThemeDark = false;

  AuthController(
    this._checkUserAuthStatusUsecase,
    this._signInWithGoogleUsecase,
    this._signOutGoogleUsecase,
    this._getCurrentUserUsecase,
    this._getUserThemeUsecase,
    this._changeUserThemeUsecase,
  );

  isUserLoggedIn() {
    isLogged = _checkUserAuthStatusUsecase();
    notifyListeners();
  }

  signInWithGoogle() async {
    loginState = LoginState.idle;
    notifyListeners();
    final result = await _signInWithGoogleUsecase();

    result.fold((l) {
      loginState = LoginState.error;
    }, (r) {
      isLogged = true;
      loginState = LoginState.success;
    });
    notifyListeners();
  }

  signOutGoogle() async {
    await _signOutGoogleUsecase();
  }

  getCurrentUser() {
    currentUser = _getCurrentUserUsecase();
    notifyListeners();
  }

  getUserThemeMode() {
    isUserThemeDark = _getUserThemeUsecase();
    notifyListeners();
  }

  changeUserThemeMode() async {
    isUserThemeDark = !isUserThemeDark;
    notifyListeners();
    await _changeUserThemeUsecase(isUserThemeDark);
  }
}
