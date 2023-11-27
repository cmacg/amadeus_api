import 'package:amadeusapi/models/hotels/offers/v3/check_in_out_policy.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "checkIn": "13:00:00",
    "checkOut": "11:00:00",
    "checkInDescription": {"text": "Check-in time is 1:00 PM", "lang": "en"},
    "checkOutDescription": {"text": "Check-out time is 11:00 AM", "lang": "en"}
  };

  final checkInOutPolicy = CheckInOutPolicy.fromJson(json);
  test('CheckInOutPolicy.fromJson', () {
    expect(checkInOutPolicy.checkIn, "13:00:00");
    expect(checkInOutPolicy.checkOut, "11:00:00");
  });

  test('CheckInOutPolicy.fromJson descriptions', () {
    expect(
        checkInOutPolicy.checkInDescription?.text, "Check-in time is 1:00 PM");
    expect(checkInOutPolicy.checkInDescription?.lang, "en");
    expect(checkInOutPolicy.checkOutDescription?.text,
        "Check-out time is 11:00 AM");
    expect(checkInOutPolicy.checkOutDescription?.lang, "en");
  });
}
