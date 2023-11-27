import 'package:amadeusapi/models/hotels/offers/v3/rate_family.dart';
import 'package:test/test.dart';

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
