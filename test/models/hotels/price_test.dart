import 'package:amadeusapi/models/hotels/price.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing the Price.toJson and fromJson methods', () {
    Map<String, dynamic> json = {
      'currency': 'USD',
      'total': '1023.33',
      'base': '999.09',
      'taxes': [
        {
          'currency': 'USD',
          'amount': '5.53',
          'code': '1',
          'percentage': '2',
          'included': true,
          'description': 'tax1',
          'pricingFrequency': 'PER_STAY',
          'pricingMode': 'PER_OCCUPANT',
        },
        {
          'currency': 'USD',
          'amount': '6.64',
          'code': '2',
          'percentage': '3',
          'included': false,
          'description': 'tax2',
          'pricingFrequency': 'PER_NIGHT',
          'pricingMode': 'PER_PRODUCT',
        },
      ],
      'variations': {
        'average': {
          'base': '1030.14',
          'total': '2134.22',
        },
        'changes': [
          {
            'startDate': '2020-12-02',
            'endDate': '1980-04-11',
            'base': '1010.78',
            'total': '1116.69',
          },
          {
            'startDate': '2020-12-03',
            'endDate': '1980-04-12',
            'base': '1110.78',
            'total': '1216.69',
          },
        ],
      }
    };

    Price price = Price.fromJson(json);
    expect(price, isNotNull);
    expect(price.currency, json['currency']);
    expect(price.total, json['total']);
    expect(price.base, json['base']);
    expect(price.taxes, isNotNull);
    expect(price.taxes.length, 2);
    expect(price.taxes[0].currency, json['taxes'][0]['currency']);
    expect(price.taxes[0].amount, json['taxes'][0]['amount']);
    expect(price.taxes[0].code, json['taxes'][0]['code']);
    expect(price.taxes[0].percentage, json['taxes'][0]['percentage']);
    expect(price.taxes[0].included, json['taxes'][0]['included']);
    expect(price.taxes[0].description, json['taxes'][0]['description']);
    expect(price.taxes[0].pricingMode, json['taxes'][0]['pricingMode']);
    expect(price.taxes[0].pricingFrequency, json['taxes'][0]['pricingFrequency']);
    expect(price.taxes[1].currency, json['taxes'][1]['currency']);
    expect(price.taxes[1].amount, json['taxes'][1]['amount']);
    expect(price.taxes[1].code, json['taxes'][1]['code']);
    expect(price.taxes[1].percentage, json['taxes'][1]['percentage']);
    expect(price.taxes[1].included, json['taxes'][1]['included']);
    expect(price.taxes[1].description, json['taxes'][1]['description']);
    expect(price.taxes[1].pricingMode, json['taxes'][1]['pricingMode']);
    expect(price.taxes[1].pricingFrequency, json['taxes'][1]['pricingFrequency']);
    expect(price.variations, isNotNull);
    expect(price.variations.average, isNotNull);
    expect(price.variations.average.base, json['variations']['average']['base']);
    expect(price.variations.average.total, json['variations']['average']['total']);
    expect(price.variations.changes, isNotNull);
    expect(price.variations.changes.length, 2);
    expect(price.variations.changes[0].startDate, DateTime.parse(json['variations']['changes'][0]['startDate']));
    expect(price.variations.changes[0].endDate, DateTime.parse(json['variations']['changes'][0]['endDate']));
    expect(price.variations.changes[0].base, json['variations']['changes'][0]['base']);
    expect(price.variations.changes[0].total, json['variations']['changes'][0]['total']);
    expect(price.variations.changes[1].startDate, DateTime.parse(json['variations']['changes'][1]['startDate']));
    expect(price.variations.changes[1].endDate, DateTime.parse(json['variations']['changes'][1]['endDate']));
    expect(price.variations.changes[1].base, json['variations']['changes'][1]['base']);
    expect(price.variations.changes[1].total, json['variations']['changes'][1]['total']);


    Map<String, dynamic> test = price.toJson();
    expect(test, isNotNull);
    expect(test['currency'], json['currency']);
    expect(test['total'], json['total']);
    expect(test['base'], json['base']);
    expect(test['taxes'], isNotNull);
    expect(test['taxes'].length, 2);
    expect(test['taxes'][0]['currency'], json['taxes'][0]['currency']);
    expect(test['taxes'][0]['amount'], json['taxes'][0]['amount']);
    expect(test['taxes'][0]['code'], json['taxes'][0]['code']);
    expect(test['taxes'][0]['percentage'], json['taxes'][0]['percentage']);
    expect(test['taxes'][0]['included'], json['taxes'][0]['included']);
    expect(test['taxes'][0]['description'], json['taxes'][0]['description']);
    expect(test['taxes'][0]['pricingMode'], json['taxes'][0]['pricingMode']);
    expect(test['taxes'][0]['pricingFrequency'], json['taxes'][0]['pricingFrequency']);
    expect(test['taxes'][1]['currency'], json['taxes'][1]['currency']);
    expect(test['taxes'][1]['amount'], json['taxes'][1]['amount']);
    expect(test['taxes'][1]['code'], json['taxes'][1]['code']);
    expect(test['taxes'][1]['percentage'], json['taxes'][1]['percentage']);
    expect(test['taxes'][1]['included'], json['taxes'][1]['included']);
    expect(test['taxes'][1]['description'], json['taxes'][1]['description']);
    expect(test['taxes'][1]['pricingMode'], json['taxes'][1]['pricingMode']);
    expect(test['taxes'][1]['pricingFrequency'], json['taxes'][1]['pricingFrequency']);
    expect(test['variations'], isNotNull);
    expect(test['variations']['average'], isNotNull);
    expect(test['variations']['average']['base'], json['variations']['average']['base']);
    expect(test['variations']['average']['total'], json['variations']['average']['total']);
    expect(test['variations']['changes'], isNotNull);
    expect(test['variations']['changes'].length, 2);
    expect(test['variations']['changes'][0]['startDate'], json['variations']['changes'][0]['startDate']);
    expect(test['variations']['changes'][0]['endDate'], json['variations']['changes'][0]['endDate']);
    expect(test['variations']['changes'][0]['base'], json['variations']['changes'][0]['base']);
    expect(test['variations']['changes'][0]['total'], json['variations']['changes'][0]['total']);
    expect(test['variations']['changes'][1]['startDate'], json['variations']['changes'][1]['startDate']);
    expect(test['variations']['changes'][1]['endDate'], json['variations']['changes'][1]['endDate']);
    expect(test['variations']['changes'][1]['base'], json['variations']['changes'][1]['base']);
    expect(test['variations']['changes'][1]['total'], json['variations']['changes'][1]['total']);
  });
}
