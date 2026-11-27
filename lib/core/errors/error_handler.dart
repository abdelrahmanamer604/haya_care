import 'package:haya_care/core/errors/exceptions.dart';
import 'package:haya_care/core/errors/failures.dart';

class _UnexpectedFailure extends Failure {
  const _UnexpectedFailure(super.message);
}

class ErrorHandler {
  ErrorHandler._();

  static Failure handle(Object error) {
    if (error is AppException) {
      return _UnexpectedFailure(error.message);
    }
    return _UnexpectedFailure(error.toString());
  }
}
