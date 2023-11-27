import 'models/errors.dart';

class AmadeusClientHttpException implements Exception {
  final int statusCode;
  final String errorMessage;
  final Errors? errors;

  AmadeusClientHttpException(this.statusCode, this.errorMessage, this.errors);

  @override
  String toString() {
    // TODO incorporate errors here
    return 'AmadeusClientHttpException{statusCode: $statusCode, errorMessage: $errorMessage}';
  }
}
