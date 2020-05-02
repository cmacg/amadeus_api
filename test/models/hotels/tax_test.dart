import 'package:amadeusapi/models/hotels/tax.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Test the fromJson and toJson method', () {
    Map<String, dynamic> json = {
      'currency': 'USD',
      'amount': '2134.23',
      'code': '1',
      'percentage': '1',
      'included': false,
      'description': 'Tax description',
      'pricingFrequency': 'PER_STAY',
      'pricingMode': 'PER_OCCUPANT'
    };

    Tax tax = Tax.fromJson(json);
    expect(tax.currency, 'USD');
    expect(tax.amount, '2134.23');
    expect(tax.code, '1');
    expect(tax.percentage, '1');
    expect(tax.included, false);
    expect(tax.description, 'Tax description');
    expect(tax.pricingFrequency, 'PER_STAY');
    expect(tax.pricingMode, 'PER_OCCUPANT');

    Map<String, dynamic> test = tax.toJson();
    expect(test['currency'], 'USD');
    expect(test['amount'], '2134.23');
    expect(test['code'], '1');
    expect(test['percentage'], '1');
    expect(test['included'], false);
    expect(test['description'], 'Tax description');
    expect(test['pricingFrequency'], 'PER_STAY');
    expect(test['pricingMode'], 'PER_OCCUPANT');
  });
}