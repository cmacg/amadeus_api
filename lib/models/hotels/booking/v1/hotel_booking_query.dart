import 'package:amadeusapi/models/hotels/booking/v1/payment.dart';
import 'package:amadeusapi/models/hotels/booking/v1/room.dart';
import 'package:amadeusapi/models/hotels/booking/v1/stakeholder.dart';

/// Query used when posting to the Amadeus self service API to make a hotel
/// booking.
class HotelBookingQuery {
  /// The offer to book.
  final String offerId;

  /// The guests that will be staying per the reservation.  Minimum one guest is
  /// mandatory.
  final List<Stakeholder> guests;

  /// Payments used to apply to the rooms.
  final List<Payment>? payments;

  /// rooms repartition (when used the rooms array items must match the shopping
  /// offer roomQuantity).
  final List<Room>? rooms;

  HotelBookingQuery(
      {required this.offerId, required this.guests, this.payments, this.rooms});

  Map<String, dynamic> toJson() => {
        'data': {
          'offerId': offerId,
          'guests': this.guests.map((e) => e.toJson()).toList(),
          'payment': this.payments == null
              ? null
              : this.payments!.map((e) => e.toJson()).toList(),
          'rooms': this.rooms == null
              ? null
              : this.rooms!.map((e) => e.toJson()).toList()
        }
      };
}
