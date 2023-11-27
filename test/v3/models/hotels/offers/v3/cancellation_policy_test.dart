import 'package:amadeusapi/models/hotels/offers/v3/cancellation_policy.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "amount": "123.00",
    "numberOfNights": 1,
    "percentage": "100",
    "deadline": "2021-01-01T12:00:00+01:00",
    "description": {"text": "NON-REFUNDABLE RATE", "lang": "en"},
    "type": "FULL_STAY"
  };

  final CancellationPolicy cancellationPolicy =
      CancellationPolicy.fromJson(json);

  test('Testing the CancellationPolicy fromJson method', () {
    expect(cancellationPolicy.amount, '123.00');
    expect(cancellationPolicy.numberOfNights, 1);
    expect(cancellationPolicy.percentage, '100');
  });

  test('Testing the CancellationPolicy deadline', () {
    print(cancellationPolicy.deadline!.toIso8601String());
    expect(cancellationPolicy.deadline!.year, 2021);
    expect(cancellationPolicy.deadline!.month, 1);
    expect(cancellationPolicy.deadline!.day, 1);
    // The date is coming back from the model in GMT, so we need to subtract the hour
    expect(cancellationPolicy.deadline!.hour, 11);
    expect(cancellationPolicy.deadline!.minute, 0);
    expect(cancellationPolicy.deadline!.second, 0);
    // The date is coming back from the model in GMT, so there is no offset
    expect(cancellationPolicy.deadline!.timeZoneOffset.inHours, 0);
  });

  test('Testing the CancellationPolicy description', () {
    expect(cancellationPolicy.description!.text, 'NON-REFUNDABLE RATE');
    expect(cancellationPolicy.description!.lang, 'en');
  });

  test('Testing the CancellationPolicy type', () {
    expect(cancellationPolicy.type, CancellationType.FULL_STAY);
  });
}
