import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';
import 'package:zelenbank/layers/data/datasources/change_balance_visibility_datasource.dart';

class ChangeBalanceVisibilityLocalDatasourceImpl
    implements ChangeBalanceVisibilityDatasource {
  final SharedPreferences sharedPreferences;
  ChangeBalanceVisibilityLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> call(bool isBalanceVisible) async {
    await sharedPreferences.setBool(
        kIsBalanceVisibleLocalStorageKey, !isBalanceVisible);
  }
}
