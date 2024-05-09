import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/data/repositories/change_balance_visibility_repository_impl.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase_impl.dart';

class MockChangeBalanceVisibilityRepository extends Mock
    implements ChangeBalanceVisibilityRepositoryImpl {}

void main() {
  late MockChangeBalanceVisibilityRepository
      mockChangeBalanceVisibilityRepository;
  late ChangeBalanceVisibilityUsecase changeBalanceVisibilityUsecase;

  setUp(() {
    mockChangeBalanceVisibilityRepository =
        MockChangeBalanceVisibilityRepository();
    changeBalanceVisibilityUsecase = ChangeBalanceVisibilityUsecaseImpl(
        mockChangeBalanceVisibilityRepository);
  });

  const bool tVisibility = false;

  test('Should return a boolean from the repository', () async {
    // arrange
    when(() => mockChangeBalanceVisibilityRepository(tVisibility))
        .thenAnswer((_) async => !tVisibility);

    // act
    await changeBalanceVisibilityUsecase(tVisibility);

    // assert
    verify(() => mockChangeBalanceVisibilityRepository(tVisibility)).called(1);
  });
}
