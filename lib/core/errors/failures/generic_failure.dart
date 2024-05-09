import '../failure.dart';

class GeneralFailure implements Failure {
  final String message;

  GeneralFailure(this.message);
}
