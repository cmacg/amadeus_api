import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/guests.dart';

void main() {
  final Map<String, dynamic> json = {
    "adults": 1,
    "childAges": [12, 10, 10]
  };

  final Guests guests = Guests.fromJson(json);

  test('Testing Guests.fromJson', () {
    expect(guests.adults, 1);
    expect(guests.childAges, [12, 10, 10]);
  });
}
