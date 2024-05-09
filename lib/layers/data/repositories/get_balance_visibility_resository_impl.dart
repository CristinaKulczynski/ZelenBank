import 'package:zelenbank/layers/data/datasources/get_balance_visibility_datasource.dart';
import 'package:zelenbank/layers/domain/repositories/get_balance_visibility_resository.dart';

class GetBalanceVisibilityRepositoryImpl
    implements GetBalanceVisibilityRepository {
  final GetBalanceVisibilityDatasource _getBalanceVisibilityDatasource;
  GetBalanceVisibilityRepositoryImpl(this._getBalanceVisibilityDatasource);

  @override
  Future<bool> call() async {
    return await _getBalanceVisibilityDatasource();
  }
}
