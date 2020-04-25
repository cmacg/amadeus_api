import 'package:amadeusapi/models/hotels/variations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Testing the Variations.fromJson and toJson methods', () {
    final Map<String, dynamic> json = {
      'changes': [{
        'startDate': '2020-12-02',
        'endDate': '1980-04-11',
        'base': '1010.78',
        'total': '1116.69',
      }],
      'average': {
        'base': '1030.14',
        'total': '2134.22',
      }
    };

    final Variations variations = Variations.fromJson(json);

  });
}