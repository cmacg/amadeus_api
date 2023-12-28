import 'package:test/test.dart';

import '../../../../../src/models/hotels/booking/v1/contact.dart';
import '../../../../../src/models/hotels/booking/v1/credit_card.dart';
import '../../../../../src/models/hotels/booking/v1/hotel_booking_query.dart';
import '../../../../../src/models/hotels/booking/v1/payment.dart';
import '../../../../../src/models/hotels/booking/v1/room.dart';
import '../../../../../src/models/hotels/booking/v1/stakeholder.dart';

main() {
  final String offerId = '1234567890';
  final StakeholderName guest1Name =
      StakeholderName(title: 'Mr', firstName: 'Bob', lastName: 'Johnson');
  final Contact guest1Contact =
      Contact(phone: '+1-123-123-1234', email: 'fake@email.com');
  final Stakeholder guest1 =
      Stakeholder(name: guest1Name, contact: guest1Contact);
  final StakeholderName guest2Name =
      StakeholderName(title: 'Mrs', firstName: 'Linda', lastName: 'Carter');
  final Contact guest2Contact =
      Contact(phone: '+31-50005000', email: 'not-here@email.com');
  final Stakeholder guest2 =
      Stakeholder(name: guest2Name, contact: guest2Contact);

  final CreditCard creditCard = CreditCard(
      vendorCode: 'VI', cardNumber: '0000111122223333', expiryDate: '2032-12');

  final Payment payment = Payment(paymentId: 1, cards: [creditCard]);

  final Room room =
      Room(guestIds: [1], paymentId: 1, specialRequest: 'special');

  HotelBookingQuery hotelBookingQuery = HotelBookingQuery(
      offerId: offerId,
      guests: [guest1, guest2],
      payments: [payment],
      rooms: [room]);

  Map<String, dynamic> json = hotelBookingQuery.toJson();

  test('Testing HotelBookingQuery toJson data', () {
    expect(json, isNotNull);
    expect(json['data'], isNotNull);
  });

  Map<String, dynamic> data = json['data'];

  test('Testing offer id', () {
    expect(data['offerId'], '1234567890');
  });

  test('Testing HotelBookingQuery toJson guest information ', () {
    expect(data['guests'] is List, true);
    expect(data['guests'][0]['name']['firstName'], 'Bob');
    expect(data['guests'][0]['name']['lastName'], 'Johnson');
    expect(data['guests'][0]['contact']['phone'], '+1-123-123-1234');
    expect(data['guests'][1]['name']['firstName'], 'Linda');
    expect(data['guests'][1]['name']['lastName'], 'Carter');
    expect(data['guests'][1]['contact']['email'], 'not-here@email.com');
  });

  test('Testing HotelBookingQuery toJson payment information ', () {
    expect(data['payment'] is List, true);
    expect(data['payment'][0]['id'], 1);
    expect(data['payment'][0]['card'] is List, true);
    expect(data['payment'][0]['card'][0]['vendorCode'], 'VI');
    expect(data['payment'][0]['card'][0]['cardNumber'], '0000111122223333');
    expect(data['payment'][0]['card'][0]['expiryDate'], '2032-12');
  });

  test('Testing HotelBookingQuery toJson room information ', () {
    expect(data['rooms'] is List, true);
    expect(data['rooms'][0]['guestIds'] is List, true);
    expect(data['rooms'][0]['guestIds'][0], 1);
    expect(data['rooms'][0]['paymentId'], 1);
    expect(data['rooms'][0]['specialRequest'], 'special');
  });
}
