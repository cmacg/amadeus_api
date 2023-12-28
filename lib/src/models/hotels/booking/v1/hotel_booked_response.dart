import 'hotel_booking.dart';
import 'warning.dart';

class HotelBookedResponse {
  List<Warning>? warnings;
  List<HotelBooking> hotelBookings;

  HotelBookedResponse.fromJson(Map<String, dynamic> json)
      : warnings = json['warnings'] == null
            ? null
            : (json['warnings'] as List)
                .map((i) => Warning.fromJson(i))
                .toList(),
        hotelBookings = (json['data'] as List)
            .map((i) => HotelBooking.fromJson(i))
            .toList();
}
