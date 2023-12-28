import 'error.dart';

class Errors {
  final List<Error> errors;

  Errors({required this.errors});

  Errors.fromJson(Map<String, dynamic> json)
      : errors = (json['errors'] as List)
            .map((error) => Error.fromJson(error))
            .toList();

  Map<String, dynamic> toJson() => {
        'errors': errors.map((error) => error.toJson()),
        //'errors': jsonEncode(errors)
      };
}
