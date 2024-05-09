import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/authentication/data/datasources/change_user_theme_datasource.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';

class ChangeUserThemeLocalDatasourceImpl implements ChangeUserThemeDatasource {
  final SharedPreferences _sharedPreferences;
  ChangeUserThemeLocalDatasourceImpl(this._sharedPreferences);

  @override
  Future<void> call(bool isThemeDark) async {
    await _sharedPreferences.setBool(
        kIsUserThemeDarkLocalStorageKey, !isThemeDark);
  }
}
