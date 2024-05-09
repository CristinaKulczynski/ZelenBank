import 'package:zelenbank/authentication/data/datasources/change_user_theme_datasource.dart';
import 'package:zelenbank/authentication/domain/repositories/change_user_theme_repository.dart';

class ChangeUserThemeRepositoryImpl implements ChangeUserThemeRepository {
  final ChangeUserThemeDatasource _changeUserThemeDatasource;
  ChangeUserThemeRepositoryImpl(this._changeUserThemeDatasource);

  @override
  Future<void> call(bool isThemeDark) async {
    await _changeUserThemeDatasource(isThemeDark);
  }
}
