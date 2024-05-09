import 'package:zelenbank/authentication/domain/repositories/get_user_theme_repository.dart';

import 'get_user_theme_usecase.dart';

class GetUserThemeUsecaseImpl implements GetUserThemeUsecase {
  final GetUserThemeRepository _getUserThemeRepository;

  GetUserThemeUsecaseImpl(this._getUserThemeRepository);

  @override
  bool call() {
    return _getUserThemeRepository();
  }
}
