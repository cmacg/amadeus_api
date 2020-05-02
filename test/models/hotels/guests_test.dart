import 'package:amadeusapi/models/hotels/guests.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Testing the Guests.toJson and fromJson methods', () {
    Map<String, dynamic> json = {
      'adults': 9,
      'childAges': [ 1,2,3 ]
    };

    Guests guests = Guests.fromJson(json);
    expect(guests.adults, 9);
    expect(guests.childAges[0], 1);
    expect(guests.childAges[1], 2);
    expect(guests.childAges[2], 3);

    Map<String, dynamic> test = guests.toJson();
    expect(test['adults'], 9);
    expect(test['childAges'][0], 1);
    expect(test['childAges'][1], 2);
    expect(test['childAges'][2], 3);
  });
}