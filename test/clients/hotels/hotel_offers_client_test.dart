import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/clients/hotels/amadeus_hotels_client.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';
import 'package:test/test.dart';

void main() async {
  final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  test('Testing the Amadeus hotels v3 client', () async {
    var ids = ['MCLONGHM', 'MCMARCOI'];
    DateTime now = DateTime.now();

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
}
