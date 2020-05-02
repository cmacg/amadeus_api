class AmadeusClientHttpException implements Exception {

  final int statusCode;
  final String errorMessage;

  AmadeusClientHttpException(this.statusCode, this.errorMessage);

  @override
  String toString() {
    return 'AmadeusClientHttpException{statusCode: $statusCode, errorMessage: $errorMessage}';
  }

}

