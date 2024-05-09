import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/sign_in_with_google_datasource_impl.dart';
import 'package:zelenbank/authentication/data/repositories/sign_in_with_google_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_in_with_google_repository.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';

class MockSignInWithGoogleDatasource extends Mock
    implements SignInWithGoogleDatasourceImpl {}

void main() {
  late MockSignInWithGoogleDatasource mockSignInWithGoogleDatasource;
  late SignInWithGoogleRepository signInWithGoogleRepository;

  setUp(() {
    mockSignInWithGoogleDatasource = MockSignInWithGoogleDatasource();
    signInWithGoogleRepository =
        SignInWithGoogleRepositoryImpl(mockSignInWithGoogleDatasource);
  });

  const bool tUserSignedIn = true;

  group('sign_in_with_google_repository', () {
    test(
        'Should return a boolean (true) from the datasource if user could log in',
        () async {
      // arrange
      when(() => mockSignInWithGoogleDatasource())
          .thenAnswer((_) async => const Right(tUserSignedIn));
      // act
      final response = await signInWithGoogleRepository();

      // assert
      expect(response, isA<Right>());
      expect(response, const Right(true));
      verify(() => mockSignInWithGoogleDatasource()).called(1);
    });

    test(
        'Should return a boolean (false) from the datasource if user could not log in',
        () async {
      // arrange
      when(() => mockSignInWithGoogleDatasource())
          .thenAnswer((_) async => const Right(!tUserSignedIn));
      // act
      final response = await signInWithGoogleRepository();

      // assert
      expect(response, isA<Right>());
      expect(response, const Right(false));
      verify(() => mockSignInWithGoogleDatasource()).called(1);
    });

    test('Should return Failure from the datasource if an Exception is thrown',
        () async {
      // arrange
      when(() => mockSignInWithGoogleDatasource())
          .thenAnswer((_) async => Left(GeneralFailure('Error')));
      // act
      final response = await signInWithGoogleRepository();

      // assert
      expect(response, isA<Left>());
      verify(() => mockSignInWithGoogleDatasource()).called(1);
    });
  });
}
