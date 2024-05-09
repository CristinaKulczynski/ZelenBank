import 'package:zelenbank/authentication/domain/entities/user_entity.dart';

abstract class GetCurrentUserUsecase {
  UserEntity call();
}
