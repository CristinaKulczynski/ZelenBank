import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/data/repositories/get_balance_visibility_resository_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase_impl.dart';

class MockGetBalanceVisibilityRepository extends Mock
    implements GetBalanceVisibilityRepositoryImpl {}

void main() {
  late MockGetBalanceVisibilityRepository mockGetBalanceVisibilityRepository;
  late GetBalanceVisibilityUsecase getBalanceVisibilityUsecase;

  setUp(() {
    mockGetBalanceVisibilityRepository = MockGetBalanceVisibilityRepository();
    getBalanceVisibilityUsecase =
        GetBalanceVisibilityUsecaseImpl(mockGetBalanceVisibilityRepository);
  });

  const bool tVisibility = false;

  test('Should return a boolean from the repository', () async {
    // arrange
    when(() => mockGetBalanceVisibilityRepository())
        .thenAnswer((_) async => tVisibility);

    // act
    final result = await getBalanceVisibilityUsecase();

    // assert
    expect(result, isA<bool>());
    verify(() => mockGetBalanceVisibilityRepository()).called(1);
  });
}
