import 'package:amadeusapi/models/hotels/offers/v3/deposit_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/payment_policy.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "amount": "100.00",
    "deadline": "2010-08-14T13:00:00",
    "description": {"text": "Deposit of 100.00", "lang": "en"},
    "acceptedPayments": {
      "creditCards": ["VI", "CA"],
      "methods": ["CREDIT_CARD", "CHECK", "VCC_BILLBACK"],
    }
  };

  final depositPolicy = DepositPolicy.fromJson(json);

  test('DepositPolicy.fromJson', () {
    expect(depositPolicy.amount, "100.00");
    expect(depositPolicy.deadline, DateTime.parse("2010-08-14T13:00:00"));
  });

  test('DepositPolicy.fromJson description', () {
    expect(depositPolicy.description?.text, "Deposit of 100.00");
    expect(depositPolicy.description?.lang, "en");
  });

  test('DepositPolicy.fromJson acceptedPayments', () {
    expect(depositPolicy.acceptedPayments?.creditCards, ["VI", "CA"]);
    expect(depositPolicy.acceptedPayments?.methods, [
      PaymentMethod.CREDIT_CARD,
      PaymentMethod.CHECK,
      PaymentMethod.VCC_BILLBACK
    ]);
  });
}
