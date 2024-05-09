import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';

import '../../repositories/change_balance_visibility_repository.dart';

class ChangeBalanceVisibilityUsecaseImpl
    extends ChangeBalanceVisibilityUsecase {
  final ChangeBalanceVisibilityRepository _changeBalanceVisibilityRepository;
  ChangeBalanceVisibilityUsecaseImpl(this._changeBalanceVisibilityRepository);

  @override
  Future<void> call(bool isBalanceVisible) async {
    await _changeBalanceVisibilityRepository(isBalanceVisible);
  }
}
