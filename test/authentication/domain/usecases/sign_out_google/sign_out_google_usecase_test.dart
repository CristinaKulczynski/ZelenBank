import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_out_google_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase_impl.dart';

class MockSignOutGoogleRepository extends Mock
    implements SignOutGoogleRepository {}

void main() {
  late MockSignOutGoogleRepository mockSignOutGoogleRepository;
  late SignOutGoogleUsecase signOutGoogleUsecase;

  setUp(() {
    mockSignOutGoogleRepository = MockSignOutGoogleRepository();
    signOutGoogleUsecase =
        SignOutGoogleUsecaseImpl(mockSignOutGoogleRepository);
  });

  group('sign_out_google_usecase', () {
    test('Should call the repository once to log out', () async {
      // arrange
      when(() => mockSignOutGoogleRepository()).thenAnswer((_) async => true);

      // act
      await signOutGoogleUsecase();

      // assert
      verify(() => mockSignOutGoogleRepository()).called(1);
    });
  });
}
