import 'package:amadeusapi/models/hotels/offers/v3/tax.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "amount": "2.00",
    "currency": "USD",
    "code": "US",
    "percentage": "",
    "included": true,
    "description": "Government issued tax",
    "pricingFrequency": "PER_STAY",
    "pricingMode": "PER_PRODUCT"
  };

  test('Testing the tas from Json', () {
    Tax tax = Tax.fromJson(json);
    expect(tax, isNotNull);
    expect(tax.amount, "2.00");
    expect(tax.code, "US");
    expect(tax.currency, "USD");
    expect(tax.percentage, "");
    expect(tax.pricingFrequency, PricingFrequency.PER_STAY);
    expect(tax.pricingMode, PricingMode.PER_PRODUCT);
  });
}
