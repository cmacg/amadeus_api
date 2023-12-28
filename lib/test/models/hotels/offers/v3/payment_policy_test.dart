import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/payment_policy.dart';

void main() {
  final Map<String, dynamic> json = {
    "creditCards": ["VI", "CA"],
    "methods": ["CREDIT_CARD", "AGENCY_ACCOUNT"]
  };

  test('Testing Payment Policy fromJson', () {
    PaymentPolicy paymentPolicy = PaymentPolicy.fromJson(json);
    expect(paymentPolicy.creditCards!.length, 2);
    expect(paymentPolicy.methods!.length, 2);
    expect(paymentPolicy.creditCards![0], 'VI');
    expect(paymentPolicy.creditCards![1], 'CA');
    expect(paymentPolicy.methods![0], PaymentMethod.CREDIT_CARD);
    expect(paymentPolicy.methods![1], PaymentMethod.AGENCY_ACCOUNT);
  });
}
