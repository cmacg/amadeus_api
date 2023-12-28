import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/rate_family.dart';

void main() {
  final Map<String, dynamic> json = {
    'code': 'PRO',
    'type': 'P',
  };

  test('Testing the RateFamily.toJson method', () {
    RateFamily rateFamily = RateFamily.fromJson(json);

    expect(rateFamily.code, 'PRO');
    expect(rateFamily.type, 'P');
  });
}
