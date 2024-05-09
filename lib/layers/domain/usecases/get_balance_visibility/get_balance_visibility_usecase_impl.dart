import 'package:zelenbank/layers/domain/repositories/get_balance_visibility_resository.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';

class GetBalanceVisibilityUsecaseImpl implements GetBalanceVisibilityUsecase {
  final GetBalanceVisibilityRepository _getBalanceVisibilityRepository;
  GetBalanceVisibilityUsecaseImpl(this._getBalanceVisibilityRepository);

  @override
  Future<bool> call() async {
    return await _getBalanceVisibilityRepository();
  }
}
