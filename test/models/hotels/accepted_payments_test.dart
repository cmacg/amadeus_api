import 'package:amadeusapi/models/hotels/accepted_payments.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Testing the Accepted Payments toJson and fromJson methods', () {
    Map<String, dynamic> json = {
      'creditCards': [ 'CA', 'VI', 'AX', 'DL', 'MA'],
      'methods': ['CREDIT_CARD', 'CORPORATE_ID', 'CHECK']
    };

    AcceptedPayments payments = AcceptedPayments.fromJson(json);
    expect(payments, isNotNull);
    expect(payments.creditCards, isNotNull);
    expect(payments.creditCards.length, 5);
    expect(payments.creditCards[0], 'CA');
    expect(payments.creditCards[1], 'VI');
    expect(payments.creditCards[2], 'AX');
    expect(payments.creditCards[3], 'DL');
    expect(payments.creditCards[4], 'MA');
    expect(payments.methods, isNotNull);
    expect(payments.methods.length, 3);
    expect(payments.methods[0], PaymentMethod.CREDIT_CARD);
    expect(payments.methods[1], PaymentMethod.CORPORATE_ID);
    expect(payments.methods[2], PaymentMethod.CHECK);

    Map<String, dynamic> test = payments.toJson();
    expect(test, isNotNull);
    expect(test['creditCards'], isNotNull);
    expect(test['creditCards'].length, 5);
    expect(test['creditCards'][0], 'CA');
    expect(test['creditCards'][1], 'VI');
    expect(test['creditCards'][2], 'AX');
    expect(test['creditCards'][3], 'DL');
    expect(test['creditCards'][4], 'MA');
    expect(test['methods'], isNotNull);
    expect(test['methods'].length, 3);
    expect(test['methods'][0], 'CREDIT_CARD');
    expect(test['methods'][1], 'CORPORATE_ID');
    expect(test['methods'][2], 'CHECK');

  });
}