import 'package:amadeusapi/models/hotels/rate_family_estimated.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing the Room.toJson and fromJson methods', () {
    Map<String, dynamic> json = {
      'code': 'PRO',
      'type': 'P',
    };

    RateFamilyEstimated rateFamilyEstimated = RateFamilyEstimated.fromJson(json);

    expect(rateFamilyEstimated.code, 'PRO');
    expect(rateFamilyEstimated.type, 'P');

    Map<String, dynamic> test = rateFamilyEstimated.toJson();
    expect(test['code'], 'PRO');
    expect(test['type'], 'P');

  });
}