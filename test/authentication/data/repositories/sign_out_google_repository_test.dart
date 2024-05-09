import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/sign_out_google_datasource_impl.dart';
import 'package:zelenbank/authentication/data/repositories/sign_out_google_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_out_google_repository.dart';

class MockSignOutGoogleDatasource extends Mock
    implements SignOutGoogleDatasourceImpl {}

void main() {
  late MockSignOutGoogleDatasource mockSignOutGoogleDatasource;
  late SignOutGoogleRepository signOutGoogleRepository;

  setUp(() {
    mockSignOutGoogleDatasource = MockSignOutGoogleDatasource();
    signOutGoogleRepository =
        SignOutGoogleRepositoryImpl(mockSignOutGoogleDatasource);
  });

  group('sign_out_google_repository', () {
    test('Should call the datasource once', () async {
      // arrange
      when(() => mockSignOutGoogleDatasource()).thenAnswer((_) async => true);

      // act
      await signOutGoogleRepository();

      // assert
      verify(() => mockSignOutGoogleDatasource()).called(1);
    });
  });
}
