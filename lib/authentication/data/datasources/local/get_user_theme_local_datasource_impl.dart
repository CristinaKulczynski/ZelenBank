import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/authentication/data/datasources/get_user_theme_datasource.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';

class GetUserThemeLocalDatasourceImpl implements GetUserThemeDatasource {
  final SharedPreferences _sharedPreferences;
  GetUserThemeLocalDatasourceImpl(this._sharedPreferences);

  @override
  bool call() {
    if (_sharedPreferences.containsKey(kIsUserThemeDarkLocalStorageKey)) {
      return _sharedPreferences.getBool(kIsUserThemeDarkLocalStorageKey)!;
    }
    _sharedPreferences.setBool(kIsUserThemeDarkLocalStorageKey, false);
    return false;
  }
}
