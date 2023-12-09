import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/clients/hotels/amadeus_hotels_client.dart';
import 'package:amadeusapi/models/hotels/booking/v1/contact.dart';
import 'package:amadeusapi/models/hotels/booking/v1/credit_card.dart';
import 'package:amadeusapi/models/hotels/booking/v1/hotel_booked_response.dart';
import 'package:amadeusapi/models/hotels/booking/v1/hotel_booking_query.dart';
import 'package:amadeusapi/models/hotels/booking/v1/payment.dart';
import 'package:amadeusapi/models/hotels/booking/v1/room.dart';
import 'package:amadeusapi/models/hotels/booking/v1/stakeholder.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';
import 'package:amadeusapi/models/hotels/search/v1/distance.dart';
import 'package:amadeusapi/models/hotels/search/v1/hotels_search_response.dart';

import 'package:test/test.dart';

void main() async {
  final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  HotelsSearchResponse searchResponse =
      await hotelClient.searchHotelsByCityCode(
          cityCode: 'PAR', radius: 5, radiusUnit: DistanceUnit.KILOMETERS);

  List<String> hotelIds = [searchResponse.hotels![0].hotelId!];
  DateTime now = DateTime.now();

  MultiResponse offersResponse = await hotelClient.getMultiHotelOffers(
      hotelIds: hotelIds,
      checkInDate: DateTime(now.year, now.month, now.day + 30),
      checkOutDate: DateTime(now.year, now.month, now.day + 32));

  final String offerId = offersResponse.data![0].offers![0].id;
  final StakeholderName guestName =
      StakeholderName(title: 'Mr', firstName: 'Bob', lastName: 'Johnson');
  final Contact guestContact =
      Contact(phone: '+1-123-123-1234', email: 'fake@email.com');
  final Stakeholder guest = Stakeholder(name: guestName, contact: guestContact);
  final CreditCard creditCard = CreditCard(
      vendorCode: 'VI', cardNumber: '0000111122223333', expiryDate: '2032-12');
  final Payment payment = Payment(paymentId: 1, cards: [creditCard]);
  final Room room =
      Room(guestIds: [1], paymentId: 1, specialRequest: 'special');

  HotelBookingQuery bookingQuery = HotelBookingQuery(
      offerId: offerId, guests: [guest], payments: [payment], rooms: [room]);

  HotelBookedResponse bookedResponse =
      await hotelClient.bookHotel(bookingQuery: bookingQuery);

  test('Did we book', () {
    expect(bookedResponse, isNotNull);
  });
}
