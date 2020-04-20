import 'package:amadeusapi/models/variations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Map<String, dynamic> json = {
    'changes': {
      'startDate': '2020-12-02',
      'endDate': '1980-04-11',
      'base': '1010.78',
      'total': '1116.69',
    },
    'average': {
      'base': '1030.14',
      'total': '2134.22',
    }
  };

  test('Testing the Variations.fromJson method', () {
    final Variations variations = Variations.fromJson(json);

  });
}