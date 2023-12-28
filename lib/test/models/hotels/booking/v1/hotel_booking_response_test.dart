import 'package:test/test.dart';

import '../../../../../src/models/hotels/booking/v1/hotel_booked_response.dart';

void main() {
  Map<String, dynamic> json = {
    "data": [
      {
        "type": "hotel-booking",
        "id": "XD_8138319951754",
        "providerConfirmationId": "8138319951754",
        "associatedRecords": [
          {"reference": "QVH2BX", "originSystemCode": "GDS"}
        ]
      }
    ]
  };

  final HotelBookedResponse bookedResponse = HotelBookedResponse.fromJson(json);

  test('Testing the HotelBookedResponse fromJson method', () {
    expect(bookedResponse, isNotNull);
    expect(bookedResponse.hotelBookings[0].type, 'hotel-booking');
    expect(bookedResponse.hotelBookings[0].id, 'XD_8138319951754');
    expect(bookedResponse.hotelBookings[0].providerConfirmationId,
        '8138319951754');
    expect(bookedResponse.hotelBookings[0].associatedRecords![0].reference,
        'QVH2BX');
    expect(
        bookedResponse.hotelBookings[0].associatedRecords![0].originSystemCode,
        'GDS');
  });
}
