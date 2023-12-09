import 'package:amadeusapi/models/hotels/offers/v3/hotel_price.dart';
import 'package:amadeusapi/models/hotels/offers/v3/tax.dart';
import 'package:test/test.dart';

void main() {
  Map<String, dynamic> json = {
    "currency": "GBP",
    "base": "805.00",
    "total": "845.25",
    "variations": {
      "average": {"base": "805.00"},
      "changes": [
        {"startDate": "2023-11-28", "endDate": "2023-11-29", "base": "805.00"}
      ]
    },
    "taxes": [
      {
        "amount": "2.00",
        "currency": "USD",
        "code": "US",
        "percentage": "",
        "included": true,
        "description": "Government issued tax",
        "pricingFrequency": "PER_STAY",
        "pricingMode": "PER_PRODUCT"
      }
    ]
  };

  final HotelPrice price = HotelPrice.fromJson(json);

  test('Testing the Price.toJson and fromJson methods', () {
    expect(price, isNotNull);
    expect(price.currency, 'GBP');
    expect(price.total, '845.25');
    expect(price.base, '805.00');
    expect(price.variations, isNotNull);
  });

  test('Testing the Price Variations.fromJson', () {
    expect(price.variations, isNotNull);
    expect(price.variations!.average, isNotNull);
    expect(price.variations!.average!.base, '805.00');

    // TODO can we get a total number back
    //expect(price.variations!.average!.total,
    //    json['variations']['average']['total']);

    expect(price.variations!.priceVariations![0], isNotNull);
    expect(price.variations!.priceVariations![0].base, '805.00');
    expect(price.variations!.priceVariations![0].startDate.year, 2023);
    expect(price.variations!.priceVariations![0].startDate.month, 11);
    expect(price.variations!.priceVariations![0].startDate.day, 28);
    expect(price.variations!.priceVariations![0].endDate.year, 2023);
    expect(price.variations!.priceVariations![0].endDate.month, 11);
    expect(price.variations!.priceVariations![0].endDate.day, 29);
  });

  test('Testing the taxes fromJson', () {
    Tax tax = price.taxes![0];
    expect(tax, isNotNull);
    expect(tax.amount, "2.00");
    expect(tax.code, "US");
    expect(tax.currency, "USD");
    expect(tax.percentage, "");
    expect(tax.pricingFrequency, PricingFrequency.PER_STAY);
    expect(tax.pricingMode, PricingMode.PER_PRODUCT);
  });
}
