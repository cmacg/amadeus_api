import 'package:test/test.dart';

import '../../src/models/errors.dart';

void main() {
  final Map<String, dynamic> json = {
    "errors": [
      {
        "status": 400,
        "code": 0,
        "title": "title",
        "detail": "detail",
        "source": {
          "parameter": "parameter",
          "pointer": "pointer",
          "example": "example"
        },
        "documentation": "documentation"
      },
      {
        "status": 500,
        "code": 5,
        "title": "title2",
        "detail": "detail2",
        "source": {
          "parameter": "parameter2",
          "pointer": "pointer2",
          "example": "example2"
        },
        "documentation": "documentation2"
      }
    ]
  };

  final Errors errors = Errors.fromJson(json);

  test('Testing the Errors fromJson method', () {
    expect(errors.errors[0].status, 400);
    expect(errors.errors[0].code, 0);
    expect(errors.errors[0].title, 'title');
    expect(errors.errors[0].detail, 'detail');
    expect(errors.errors[0].source!.parameter, 'parameter');
    expect(errors.errors[0].source!.pointer, 'pointer');
    expect(errors.errors[0].source!.example, 'example');
    expect(errors.errors[1].status, 500);
    expect(errors.errors[1].code, 5);
    expect(errors.errors[1].title, 'title2');
    expect(errors.errors[1].detail, 'detail2');
    expect(errors.errors[1].source!.parameter, 'parameter2');
    expect(errors.errors[1].source!.pointer, 'pointer2');
    expect(errors.errors[1].source!.example, 'example2');
  });
}
