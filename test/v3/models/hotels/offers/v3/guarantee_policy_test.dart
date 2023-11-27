import 'package:amadeusapi/models/hotels/offers/v3/guarantee_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/payment_policy.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "description": {"text": "Deposit of 100.00", "lang": "en"},
    "acceptedPayments": {
      "creditCards": ["VI", "CA"],
      "methods": ["CREDIT_CARD", "CHECK", "VCC_BILLBACK"],
    }
  };

  final GuaranteePolicy guaranteePolicy = GuaranteePolicy.fromJson(json);

  test('GuaranteePolicy.fromJson description', () {
    expect(guaranteePolicy.description?.text, "Deposit of 100.00");
    expect(guaranteePolicy.description?.lang, "en");
  });

  test('DepositPolicy.fromJson acceptedPayments', () {
    expect(guaranteePolicy.acceptedPayments?.creditCards, ["VI", "CA"]);
    expect(guaranteePolicy.acceptedPayments?.methods, [
      PaymentMethod.CREDIT_CARD,
      PaymentMethod.CHECK,
      PaymentMethod.VCC_BILLBACK
    ]);
  });
}
