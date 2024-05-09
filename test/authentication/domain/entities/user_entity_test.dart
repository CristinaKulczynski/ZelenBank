import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';

void main() {
  final UserEntity tUserEntity = UserEntity(
    uid: 'uid',
    name: 'name',
    profilePhotoUrl: 'profilePhotoUrl',
  );

  test('Should be a user entity and field data types should be string', () {
    expect(tUserEntity, isA<UserEntity>());
    expect(tUserEntity.name, isA<String>());
  });
}
