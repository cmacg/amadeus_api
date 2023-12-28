import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/price_variations.dart';

void main() {
  test('Testing the Price Variations.fromJson', () {
    final Map<String, dynamic> json = {
      'changes': [
        {
          'startDate': '2020-12-02',
          'endDate': '1980-04-11',
          'base': '1010.78',
          'total': '1116.69',
        }
      ],
      'average': {
        'base': '1030.14',
        'total': '2134.22',
      }
    };

    final PriceVariations variations = PriceVariations.fromJson(json);
    expect(variations, isNotNull);
  });
}
