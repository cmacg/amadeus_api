import 'package:amadeusapi/models/hotels/offers/v3/hold_policy.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {"deadline": "2010-08-14T13:00:00"};

  HoldPolicy holdPolicy = HoldPolicy.fromJson(json);

  test('HoldPolicy.fromJson', () {
    expect(holdPolicy.deadline, DateTime.parse("2010-08-14T13:00:00"));
  });
}
