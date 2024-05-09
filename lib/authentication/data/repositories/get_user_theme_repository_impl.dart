import 'package:zelenbank/authentication/data/datasources/get_user_theme_datasource.dart';
import 'package:zelenbank/authentication/domain/repositories/get_user_theme_repository.dart';

class GetUserThemeRepositoryImpl implements GetUserThemeRepository {
  final GetUserThemeDatasource _getUserThemeDatasource;
  GetUserThemeRepositoryImpl(this._getUserThemeDatasource);

  @override
  bool call() {
    return _getUserThemeDatasource();
  }
}
