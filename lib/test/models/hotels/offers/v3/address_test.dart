import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/address.dart';

void main() {
  final Map<String, dynamic> json = {
    "lines": ["Address Line 1", "Address Line 2"],
    "countryCode": "GB",
    "postalCode": "W6 8DL",
    "cityName": "London",
    "stateCode": "England"
  };

  final Address address = Address.fromJson(json);

  test('Testing the Address fromJson method', () {
    expect(address.lines![0], 'Address Line 1');
    expect(address.lines![1], 'Address Line 2');
    expect(address.postalCode, 'W6 8DL');
    expect(address.cityName, 'London');
    expect(address.stateCode, 'England');
    expect(address.countryCode, 'GB');
  });
}
