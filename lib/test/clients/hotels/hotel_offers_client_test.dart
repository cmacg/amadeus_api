import 'package:test/test.dart';

import '../../../credentials.dart';
import '../../../src/clients/hotels/amadeus_hotels_client.dart';
import '../../../src/models/hotels/offers/v3/hotel.dart';
import '../../../src/models/hotels/offers/v3/hotel_offer.dart';
import '../../../src/models/hotels/offers/v3/hotel_offers.dart';
import '../../../src/models/hotels/offers/v3/hotel_price.dart';
import '../../../src/models/hotels/offers/v3/multi_response.dart';

void main() async {
  final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  DateTime now = DateTime.now();

  test('Testing the Amadeus hotels v3 client', () async {
    final List<String> ids = ['MCLONGHM', 'MCMARCOI'];

    MultiResponse multiResponse = await hotelClient.getMultiHotelOffers(
        hotelIds: ids,
        checkInDate: DateTime(now.year, now.month, now.day + 1),
        checkOutDate: DateTime(now.year, now.month, now.day + 2),
        countryOfResidence: 'US',
        adults: 1,
        includeClosed: false,
        bestRateOnly: false);

    expect(multiResponse, isNotNull);
  });

  test('Testing the hotel offers pricing', () async {
    final String offerId = '4SFY87Q85U';

    HotelOffers hotelOffers =
        await hotelClient.getOfferPricing(offerId: offerId, lang: 'en-US');

    expect(hotelOffers, isNotNull);
    Hotel hotel = hotelOffers.hotel!;
    HotelOffer hotelOffer = hotelOffers.offers![0];
    HotelPrice hotelPrice = hotelOffers.offers![0].hotelPrice;

    expect(hotel.chainCode, 'MC');
    expect(hotel.hotelId, 'MCLONGHM');
    expect(hotelOffer.checkInDate, DateTime(now.year, now.month, now.day + 1));
    expect(hotelOffer.checkOutDate, DateTime(now.year, now.month, now.day + 2));

    expect(hotelPrice.currency, 'GBP');
    expect(hotelPrice.base, '695.00');
  });
}
