import 'package:zelenbank/authentication/domain/repositories/change_user_theme_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/change_user_theme/change_user_theme_usecase.dart';

class ChangeUserThemeUsecaseImpl implements ChangeUserThemeUsecase {
  final ChangeUserThemeRepository _changeUserThemeRepository;
  ChangeUserThemeUsecaseImpl(this._changeUserThemeRepository);

  @override
  Future<void> call(bool isThemeDark) async {
    await _changeUserThemeRepository(isThemeDark);
  }
}
