import 'package:amadeusapi/models/hotels/offers/v3/commission.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "percentage": "100",
    "amount": "1.00",
    "description": {"text": "NON-REFUNDABLE RATE", "lang": "en"}
  };

  final Commission commission = Commission.fromJson(json);
  test('Testing the Commission.toJson method', () {
    expect(commission.percentage, '100');
    expect(commission.amount, '1.00');
  });

  test('Testing the Commission description', () {
    expect(commission.description!.text, 'NON-REFUNDABLE RATE');
    expect(commission.description!.lang, 'en');
  });
}
